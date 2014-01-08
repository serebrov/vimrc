"  Vim tab session manager.
"
"  Based on sessionman.vim by Yuri Klubakov (see
"  http://www.vim.org/scripts/script.php?script_id=2010)
"
"  Author:      Boris Serebrov <serebrov at gmail dot com>
"  License:     GPL (same as original plugin)
"
"  Description:
"
"  Plugin wraps ':mksession' to add following features:
"
"  * :SessionSave command to create and name a new session
"  * :SessionSaveAs to rename existiong session
"  * :SessionOpen to open session
"  * :SessionList to show the list of sessions
"  * Keep list of sessions (see default locations below)
"  * Multiple sessions - one session per tab
"   * Note: since tab is used as a session container the session itself
"           will not save tabs
"  * Automatically load last sessions when Vim starts
"
"  On Windows, DOS and OS2 sessions are saved in:
"    "$HOME/vimfiles/sessions"   if $HOME is defined
"    "$APPDATA/Vim/sessions"     if $APPDATA is defined
"    "$VIM/sessions"             otherwise
"  On Unix sessions are saved in:
"    "$HOME/.vim/sessions"
"  If this directory does not exist, it will be created by the :SessionSave
"  command.

if !has('mksession') || exists('loaded_sessionman')
    finish
endif
let loaded_sessionman = 1
let s:num_sessions = 0
let s:sessions = {}

command! -nargs=1 -complete=custom,s:session_open_complete SessionOpen call s:session_open(<f-args>)
command! -nargs=0 SessionClose call s:session_close()
command! -nargs=0 SessionList call s:session_list()
command! -nargs=? SessionSave call s:session_save_ask(<f-args>)
command! -nargs=0 SessionShow call s:session_show()
command! -nargs=0 SessionRestore call s:session_restore_all()

augroup tabsession
    autocmd!
    " autosave session
    autocmd TabLeave * call s:session_save()
    autocmd VimLeave * call s:session_save_all()
    " load last session on start
    autocmd VimEnter * nested call s:session_vim_enter()
augroup END

if !exists('sessionman_path')
    if has("win32") || has("dos32") || has("dos16") || has("os2")
        let s:sessions_path = ($HOME != '') ? $HOME . '/vimfiles' : ($APPDATA != '') ? $APPDATA . '/Vim' : $VIM
        let s:sessions_path = substitute(s:sessions_path, '\\', '/', 'g') . '/sessions'
    else
        let s:sessions_path = $HOME . '/.vim/sessions'
    endif
else
    let s:sessions_path = g:sessionman_path
endif
let s:sessions_file = s:sessions_path . '/_sessions.vim'

function! s:session_open(name)
    if s:has_session()
        echom 'Session open has: '.s:get_session()
        call s:session_save()
        call s:remove_session()
    endif
    let buf_count = s:_wipe_buffers()
    if buf_count == -1
        "if there is a modified buffer - exit
        return
    endif
    call s:session_load(a:name)
endfunction

function! s:session_load(name)
    if a:name != '' && a:name[0] != '"'
        execute 'silent so ' . s:sessions_path . '/' . a:name
        call s:set_session(a:name)
        call s:write_sessions()
    endif
endfunction

function! s:session_close()
    if s:has_session()
        call s:remove_session()
        call s:_wipe_buffers()
        call s:write_sessions()
    endif
endfunction

function! s:session_delete(name)
    if a:name != '' && a:name[0] != '"'
        let save_go = &guioptions
        set guioptions+=c
        if confirm('Are you sure you want to delete "' . a:name . '" session?', "&Yes\n&No", 2) == 1
            let session_tabnr = s:find_session(a:name)
            if session_tabnr
                call remove(s:sessions, session_tabnr)
            endif
            setlocal modifiable
            d
            setlocal nomodifiable
            if delete(s:sessions_path . '/' . a:name) != 0
                redraw | echohl ErrorMsg | echo 'Error deleting "' . a:name . '" session file' | echohl None
            endif
            call s:write_sessions()
        endif
        let &guioptions = save_go
    endif
endfunction

function! s:session_edit(name)
    if a:name != '' && a:name[0] != '"'
        bwipeout
        execute 'silent edit ' . s:sessions_path . '/' . a:name
        set ft=vim
    endif
endfunction

function! s:session_edit_extra(name)
    if a:name != '' && a:name[0] != '"'
        bwipeout
        let n = substitute(a:name, "\\.[^.]*$", '', '')
        execute 'silent edit ' . s:sessions_path . '/' . n . 'x.vim'
    endif
endfunction

function! s:session_list()
    let w_sl = bufwinnr("__SessionList__")
    if w_sl != -1
        execute w_sl . 'wincmd w'
        return
    endif
    silent split __SessionList__

    " Mark the buffer as scratch
    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal nowrap
    setlocal nobuflisted

    nnoremap <buffer> <silent> q :bwipeout<CR>
    nnoremap <buffer> o :call <SID>session_open(getline('.'))<CR>
    nnoremap <buffer> <CR> :call <SID>session_open(getline('.'))<CR>
    nnoremap <buffer> <2-LeftMouse> :call <SID>session_open(getline('.'))<CR>
    nnoremap <buffer> <silent> d :call <SID>session_delete(getline('.'))<CR>
    nnoremap <buffer> <silent> e :call <SID>session_edit(getline('.'))<CR>
    nnoremap <buffer> <silent> x :call <SID>session_edit_extra(getline('.'))<CR>

    syn match Comment "^\".*"
    silent put ='\"-----------------------------------------------------'
    silent put ='\" q                        - close session list'
    silent put ='\" o, <CR>, <2-LeftMouse>   - open session'
    silent put ='\" d                        - delete session'
    silent put ='\" e                        - edit session'
    silent put ='\" x                        - edit extra session script'
    silent put ='\"-----------------------------------------------------'
    silent put =''
    let l = line(".")

    let sessions = substitute(glob(s:sessions_path . '/*'), '\\', '/', 'g')
    let sessions = substitute(sessions, "\\(^\\|\n\\)" . s:sessions_path . '/', '\1', 'g')
    let sessions = substitute(sessions, "\n[^\n]\\+x\\.vim\n", '\n', 'g')
    if sessions == ''
        syn match Error "^\" There.*"
        let sessions = '" There are no saved sessions'
    endif
    silent put =sessions

    silent 0,1d
    execute l
    setlocal nomodifiable
    setlocal nospell
endfunction

function! s:session_save_ask(...)
    let name = a:0
    if empty(name)
        let name = s:get_session()
    endif
    if !empty(name)
        let name = input('Save session as: ', name)
    else
        let name = input('Save session as: ')
    endif
    call s:session_save(name)
endfunction

function! s:session_save(...)
    let name = a:0
    if empty(name)
        let name = s:get_session()
    endif
    if empty(name)
        return
    endif

    if v:version >= 700 && finddir(s:sessions_path, '/') == ''
        call mkdir(s:sessions_path, 'p')
    endif
    silent! argdel *
    call s:set_session(name)
    let sessionoptions = &sessionoptions
    try
        set sessionoptions-=options
        set sessionoptions-=tabpages
        execute 'mksession! ' . s:sessions_path . '/' . name
        "call writefile(insert(readfile(g:this_obsession), 'let g:this_obsession = v:this_session', -2), g:this_obsession)
        call s:write_sessions()
        redraw | echo 'Saved session "' . name . '"'
    catch
        redraw | echo 'Error saving session "' . string(v:exception) . '"'
    finally
        let &sessionoptions = sessionoptions
    endtry
endfunction

" function! s:session_save(do_save_as)
"     let name = s:get_session()
"     if name != 0 && name != ''
"         call s:session_save_as(substitute(name, '.*\(/\|\\\)', '', ''))
"     else
"         if a:do_save_as
"             call s:session_save_as()
"         endif
"     endif
" endfunction

function! s:session_save_all()
    for key in keys(s:sessions)
        exe ":tabnext ".key
        call s:session_save()
    endfor
endfunction

function! s:session_show()
    if s:has_session()
        echon 'Current session is "' . substitute(s:get_session(), '.*\(/\|\\\)', '', '') . '"'
    else
        echon 'Current session is empty'
    endif
    echon ', sessions are "' . string(s:sessions) . '"'
endfunction

" function! s:is_empty_tab()
"     let buflist = tabpagebuflist()
"     for i in buflist
"         if bufname(i) != '' && bufname(i) != '__SessionList__'
"             return 0
"         endif
"     endfor
"     return 1
" endfunction

function! s:set_session(name)
    let s:sessions[tabpagenr()] = a:name
endfunction

function! s:find_session(name)
    for key in keys(s:sessions)
        if s:sessions[key] ==? a:name
            return key
        endif
    endfor
endfunction

function! s:has_session()
    return has_key(s:sessions, tabpagenr())
endfunction

function! s:remove_session()
    return remove(s:sessions, tabpagenr())
endfunction

function! s:get_session()
    if s:has_session()
        return s:sessions[tabpagenr()]
    endif
endfunction

function! s:check_sessions()
    for key in keys(s:sessions)
        " result is integer "0" (and integer type = 0) if there is no such tab page
        if type(tabpagebuflist(key)) == 0
            call remove(s:sessions, key)
        endif
    endfor
endfunction

function! s:write_sessions()
    call s:check_sessions()
    let res = writefile(['let g:__sessions_list__ = ' . string(s:sessions)], s:sessions_file)
    if res == -1
        echohl ErrorMsg
    endif
endfunction

function! s:session_open_complete(A, L, P)
    let sessions = substitute(glob(s:sessions_path . '/*'), '\\', '/', 'g')
    return substitute(sessions, '\(^\|\n\)' . s:sessions_path . '/', '\1', 'g')
endfunction

function! s:_wipe_buffers()
    " if index(split(&sessionoptions,','), 'tabpages') == -1
    "     " tabpages are not saved into the session, so
    "     " we assume that sessions will be loaded inside tabs
    "     " and wipe only current tab buffers
        call s:_wipe_tab_buffers()
    " else
    "     call s:_wipe_all_buffers()
    " endif
endfunction

function! s:_wipe_all_buffers()
    let last_buffer = bufnr('$')
    let delete_count = 0
    let n = 1
    while n <= last_buffer
        if buflisted(n)
            if getbufvar(n, '&modified')
                echohl ErrorMsg
                echomsg 'No write since last change for buffer'
                echohl None
                return -1
            else
                silent exe 'bwipeout ' . n
                if ! buflisted(n)
                    let delete_count = delete_count+1
                endif
            endif
        endif
        let n = n+1
    endwhile
    return delete_count
endfunction

function! s:_wipe_tab_buffers()
    let buflist = tabpagebuflist()
    let delete_count = 0
    for i in buflist
        if buflisted(i)
            if getbufvar(i, '&modified') && getbufvar(i, '&filetype') != "netrw"
                echohl ErrorMsg
                echomsg 'No write since last change for buffer'
                echohl None
                return -1
            else
                silent exe 'bwipeout ' . i
                if ! buflisted(i)
                    let delete_count = delete_count+1
                endif
            endif
        endif
    endfor
    return delete_count
endfunction

function! s:session_restore_all()
    if filereadable(s:sessions_file)
        exec ":source " . s:sessions_file
        let sessions = g:__sessions_list__
        for key in keys(sessions)
            call s:session_load(sessions[key])
            tabnew
        endfor
        unlet! g:__sessions_list__
        tabclose
    endif
endfunction

function! s:session_vim_enter()
    if bufnr('$') == 1 && bufname('%') == '' && !&mod && getline(1, '$') == ['']
        call s:session_restore_all()
    endif
endfunction


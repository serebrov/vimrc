"============================================================================"
"
"  Vim session manager
"
"  Copyright (c) Yuri Klubakov
"
"  Author:      Yuri Klubakov <yuri.mlists at gmail dot com>
"  Version:     1.06 (2011-05-06)
"  Requires:    Vim 6
"  License:     GPL
"
"  Description:
"
"  Vim provides a ':mksession' command to save the current editing session.
"  This plug-in helps to work with Vim sessions by keeping them in the
"  dedicated location and by providing commands to list all sessions, open
"  session, open last session, close session, save session and show last
"  session.  From a list of sessions you can open session, delete session,
"  edit session and edit extra session script.  Please note that session
"  name can contain spaces and does not have to have a .vim extension.
"
"  On Windows, DOS and OS2 sessions are saved in:
"    "$HOME/vimfiles/sessions"   if $HOME is defined
"    "$APPDATA/Vim/sessions"     if $APPDATA is defined
"    "$VIM/sessions"             otherwise
"  On Unix sessions are saved in:
"    "$HOME/.vim/sessions"
"  If this directory does not exist, it will be created by the :SessionSave
"  command (requires Vim 7).
"
"  :SessionList command creates a new window with session names.
"  At the top of the window there is a help that shows normal mode mappings:
"    q                        - close session list
"    o, <CR>, <2-LeftMouse>   - open session
"    d                        - delete session
"    e                        - edit session
"    x                        - edit extra session script
"  The name of an opened session is saved in g:LAST_SESSION variable which is
"  saved in the viminfo file if 'viminfo' option contains '!'.  It is used to
"  open last session by :SessionOpenLast command.  It can be done when Vim
"  starts (gvim +bd -c SessionOpenLast) or any time during a Vim session.
"  You can edit an extra session script to specify additional settings and
"  actions associated with a given session.
"
"  :SessionOpen command takes a session name as an argument.  It supports
"  argument completion.
"
"  :SessionOpenLast command opens the g:LAST_SESSION session (see above).
"
"  :SessionClose command wipes out all buffers and clears variables with session name.
"
"  :SessionSave command saves the current editing session.  If v:this_session
"  is empty it asks for a session name.
"
"  :SessionSaveAs command takes a session name as an optional argument.  If
"  there is no argument or it is empty, it asks for a session name (default
"  is the last part of v:this_session).
"
"  :SessionShowLast command shows the content of the g:LAST_SESSION and
"  v:this_session variables.
"
"  If 'sessionman_save_on_exit != 0' (default) then the current editing
"  session will be automatically saved when you exit Vim.
"
"  Plug-in creates a "Sessions" sub-menu under the "File" menu.
"
"============================================================================"

if !has('mksession') || exists('loaded_sessionman')
    finish
endif
let loaded_sessionman = 1

if !exists('sessionman_save_on_exit')
    let sessionman_save_on_exit = 1
endif

let s:cpo_save = &cpo
set cpo&vim

if has("win32") || has("dos32") || has("dos16") || has("os2")
    let s:sessions_path = ($HOME != '') ? $HOME . '/vimfiles' : ($APPDATA != '') ? $APPDATA . '/Vim' : $VIM
    let s:sessions_path = substitute(s:sessions_path, '\\', '/', 'g') . '/sessions'
else
    let s:sessions_path = $HOME . '/.vim/sessions'
endif

"============================================================================"

function! s:OpenSession(name)
    if g:sessionman_save_on_exit && v:this_session != ''
        call s:SaveSession()
    endif
    if a:name != '' && a:name[0] != '"'
        try
            set eventignore=all
            let buf_count = s:_wipeBuffers()
            if buf_count == -1
                "if there is a modified buffer - exit
                return
            endif
            let n = bufnr('%')
            execute 'silent so ' . s:sessions_path . '/' . a:name
        finally
            set eventignore=
            doautoall BufRead
            doautoall FileType
            doautoall BufEnter
            doautoall BufWinEnter
            doautoall TabEnter
            doautoall SessionLoadPost
        endtry
        let g:LAST_SESSION = a:name
    endif
    let buf_num = bufnr('%')
    windo filetype detect
endfunction

"============================================================================"

function! s:CloseSession()
    call s:_wipeBuffers()
    unlet! g:LAST_SESSION
    let v:this_session = ''
endfunction

"============================================================================"

function! s:DeleteSession(name)
    if a:name != '' && a:name[0] != '"'
        let save_go = &guioptions
        set guioptions+=c
        if confirm('Are you sure you want to delete "' . a:name . '" session?', "&Yes\n&No", 2) == 1
            setlocal modifiable
            d
            setlocal nomodifiable
            if delete(s:sessions_path . '/' . a:name) != 0
                redraw | echohl ErrorMsg | echo 'Error deleting "' . a:name . '" session file' | echohl None
            endif
        endif
        let &guioptions = save_go
    endif
endfunction

"============================================================================"

function! s:EditSession(name)
    if a:name != '' && a:name[0] != '"'
        bwipeout
        execute 'silent edit ' . s:sessions_path . '/' . a:name
        set ft=vim
    endif
endfunction

"============================================================================"

function! s:EditSessionExtra(name)
    if a:name != '' && a:name[0] != '"'
        bwipeout
        let n = substitute(a:name, "\\.[^.]*$", '', '')
        execute 'silent edit ' . s:sessions_path . '/' . n . 'x.vim'
    endif
endfunction

"============================================================================"

function! s:ListSessions()
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
    nnoremap <buffer> o :call <SID>OpenSession(getline('.'))<CR>
    nnoremap <buffer> <CR> :call <SID>OpenSession(getline('.'))<CR>
    nnoremap <buffer> <2-LeftMouse> :call <SID>OpenSession(getline('.'))<CR>
    nnoremap <buffer> <silent> d :call <SID>DeleteSession(getline('.'))<CR>
    nnoremap <buffer> <silent> e :call <SID>EditSession(getline('.'))<CR>
    nnoremap <buffer> <silent> x :call <SID>EditSessionExtra(getline('.'))<CR>

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

"============================================================================"

function! s:SaveSessionAs(...)
    if a:0 == 0 || a:1 == ''
        let name = input('Save session as: ', substitute(v:this_session, '.*\(/\|\\\)', '', ''))
    else
        let name = a:1
    endif
    if name != ''
        if v:version >= 700 && finddir(s:sessions_path, '/') == ''
            call mkdir(s:sessions_path, 'p')
        endif
        silent! argdel *
        let g:LAST_SESSION = name
        execute 'silent mksession! ' . s:sessions_path . '/' . name
        redraw | echo 'Saved session "' . name . '"'
    endif
endfunction

"============================================================================"

function! s:SaveSession()
    call s:SaveSessionAs(substitute(v:this_session, '.*\(/\|\\\)', '', ''))
endfunction

"============================================================================"

function! s:ShowLastSession()
    if exists('g:LAST_SESSION')
        redraw | echo 'Last session is "' . g:LAST_SESSION . '"'
    else
        redraw | echo 'Last session is undefined'
    endif
    echon ', current session is "' . substitute(v:this_session, '.*\(/\|\\\)', '', '') . '"'
endfunction

"============================================================================"

function! s:SessionOpenComplete(A, L, P)
    let sessions = substitute(glob(s:sessions_path . '/*'), '\\', '/', 'g')
    return substitute(sessions, '\(^\|\n\)' . s:sessions_path . '/', '\1', 'g')
endfunction

"============================================================================"

function! s:_wipeBuffers()
    if index(split(&sessionoptions,','), 'tabpages') == -1
        " tabpages are not saved into the session, so
        " we assume that sessions will be loaded inside tabs
        " and wipe only current tab buffers
        call s:_wipeTabBuffers()
    else
        call s:_wipeAllBuffers()
    endif
endfunction

function! s:_wipeAllBuffers()
    let last_buffer = bufnr('$')
    let delete_count = 0
    let n = 1
    "let buffer = bufnr('%')
    "
    while n <= last_buffer
        "if n != buffer && buflisted(n)
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

function! s:_wipeTabBuffers()
    let buflist = tabpagebuflist()
    let delete_count = 0
    "for i in range(1, bufnr('$'))
    for i in buflist
        if buflisted(i)
            if getbufvar(i, '&modified')
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

function! s:RestoreLastSessionMan()
    " Check that the user has started Vim without editing any files.
    if bufnr('$') == 1 && bufname('%') == '' && !&mod && getline(1, '$') == ['']
        :SessionOpenLast
    endif
endfunction

"============================================================================"

command! -nargs=1 -complete=custom,s:SessionOpenComplete SessionOpen call s:OpenSession(<f-args>)
command! -nargs=0 SessionOpenLast if exists('g:LAST_SESSION') | call s:OpenSession(g:LAST_SESSION) | endif
command! -nargs=0 SessionClose call s:CloseSession()
command! -nargs=0 SessionList call s:ListSessions()
command! -nargs=0 SessionSave call s:SaveSession()
command! -nargs=? SessionSaveAs call s:SaveSessionAs(<f-args>)
command! -nargs=0 SessionShowLast call s:ShowLastSession()

"============================================================================"

an 10.370 &File.-SessionsSep-               <Nop>
an 10.371 &File.S&essions.&Open\.\.\.       :SessionList<CR>
an 10.372 &File.S&essions.Open\ &Last       :SessionOpenLast<CR>
an 10.373 &File.S&essions.&Close            :SessionClose<CR>
an 10.374 &File.S&essions.&Save             :SessionSave<CR>
an 10.375 &File.S&essions.Save\ &As\.\.\.   :SessionSaveAs<CR>

aug sessionman
    au VimLeavePre * if sessionman_save_on_exit && v:this_session != '' | call s:SaveSession() | endif

    " load last session on start
    autocmd VimEnter * nested call s:RestoreLastSessionMan()
aug END

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: set ts=4 sw=4 noet :

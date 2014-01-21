if !exists("g:potion_command")
    let g:potion_command = "~/potion/bin/potion"
endif

function! PotionCompileAndRunFile()
    write
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
    write
    " Get the bytecode.
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    if v:shell_error ==# '1'
        " error getting bytecode
        echoerr bytecode
        return
    endif

    let winnr = bufwinnr('__Potion_Bytecode__')
    if winnr == -1
        " Open a new split and set it up.
        vsplit __Potion_Bytecode__
    else
        execute winnr . " wincmd w"
        normal! ggvGd
    endif
    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile

    " Insert the bytecode.
    call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>

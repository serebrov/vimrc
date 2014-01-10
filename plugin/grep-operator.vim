" see http://learnvimscriptthehardway.stevelosh.com/chapters/33.html
"
nnoremap <Leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
" foo'ls

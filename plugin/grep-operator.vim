" see http://learnvimscriptthehardway.stevelosh.com/chapters/33.html
"
" nnoremap <Leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
" foo'ls
"
" viw<leader>g: Visually select a word, then grep for it.
" <leader>g4w: Grep for the next four words.
" <leader>gt;: Grep until semicolon.
" <leader>gi[: Grep inside square brackets.

nnoremap <Leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
" <c-u> removes text from cursor to the beginning of the line (removes '<,'>
" automatically added by vim when we press ':' having visual selection)
vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
  let saved_unnamed_register = @@

  if a:type ==# 'v'
    execute "normal! `<v`>y"
  elseif a:type ==# 'char'
    execute "normal! `[v`]y"
  else
    return
  endif

  "echom shellescape(@@)
  silent execute "grep! -R " . shellescape(@@) . " ."
  copen

  let @@ = saved_unnamed_register
endfunction

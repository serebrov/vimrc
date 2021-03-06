" rj-white/waterfall.vim
" # Waterfall
" 
" A minimal Vim colorscheme, inspired by [Paramount].
" 
" ![Vim script screenshot](https://i.imgur.com/AXb4p3V.png)
" 
" ## Installation
" 
" Use your preferred plugin manager, e.g. using vim-plug:
" 
"     Plugin 'rj-white/waterfall.vim'
" 
" ## Usage
" 
"     :colorscheme waterfall
" 
" Note that Waterfall does not set the background color.
" 
" [Paramount]: https://github.com/owickstrom/vim-colors-paramount
" MIT License
"
" Copyright (c) 2019 Robert White
"
highlight clear

if exists('syntax on')
    syntax reset
endif

set background=dark
let g:colors_name='waterfall'

highlight Normal ctermfg=251
highlight! link Identifier Normal
highlight! link Function Normal
autocmd FileType vim highlight! link Type Normal

highlight Constant ctermfg=153

highlight Statement ctermfg=24
highlight! link Title Statement
highlight! link Type Statement

highlight Comment ctermfg=239
highlight! link PreProc Comment
highlight! link Special Comment

highlight Italic cterm=italic
highlight Bold cterm=bold

highlight LineNr ctermfg=239
highlight CursorLineNr ctermfg=236
highlight StatusLine ctermbg=NONE ctermfg=white cterm=NONE

" Plugins {{{
  set nocompatible " explicitly get out of vi-compatible mode
  " filetype off

  call plug#begin('~/.vim/plugged')

  " sensible defaults
  Plug 'tpope/vim-sensible'

  " auto adjust tab/space settings based on current file
  Plug 'tpope/vim-sleuth'

  " <leader>ww in first window and then <leader>ww in second to swap them.
  Plug 'wesq3/vim-windowswap'

  " Folding
    set foldenable
    " set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    " Don't autofold anything (but I can still fold manually)
    " set foldlevel=100
    " Open all folds:
    set foldlevel=0
    " set foldlevel=999

    " Generic folding mechanism and motion based on indentation.
    " Fold anything that is structured into indented blocks.
    " Quickly navigate between blocks.
    Plug 'pseewald/vim-anyfold'
    " set foldmethod=syntax
    " let anyfold_activate=1  " Note: it conflicts with Magit buffer
    " let anyfold_fold_comments=1
    autocmd Filetype php,css,vue,vim :AnyFoldActivate

    " From 'pangloss/vim-javascript' readme
    augroup javascript_folding
        au!
        au FileType javascript setlocal foldmethod=syntax
        au FileType typescript setlocal foldmethod=syntax
    augroup END

    " python folding
    " let g:SimpylFold_docstring_preview = 1
    " Plug 'tmhedberg/SimpylFold'

    " let g:coiled_snake_set_foldtext = 0
    Plug 'kalekundert/vim-coiled-snake'
    " Recommended to make folding faster.
    Plug 'Konfekt/FastFold'

    " Vim's fold commands:
    " zf{motion} or {Visual}zf - create a manual fold
    " za - open/close current fold, zA - recursively
    "   zo - open, zc - close
    "   zO / zC - recursively
    " zR - open all folds, zr - reduce folds 1-level
    " zM - close all folds, zm - increase folds 1-level
    "
    " Navigate between blocks:
    " zj / zk - next / prev fold
    " [[ / ]] - beginning / end of the current fold
    " ]k / [j - end of prev block / beginning of the next block
    "
    " Unfolds the line in which the cursor is located when opening a file
    autocmd User anyfoldLoaded normal zv
    " hi Folded guifg=#6AC8B1
    " autocmd User anyfoldLoaded hi Folded guifg=#4592EF
    " autocmd User anyfoldLoaded hi Folded guifg=#6AB3C8
    autocmd User anyfoldLoaded hi Folded guifg=#608cc3
    autocmd User Filetype python hi Folded guifg=#608cc3

    " Cycle open and closed folds and nested folds - <CR> / <BS>
    Plug 'arecarn/vim-fold-cycle'

    " hi Folded term=NONE cterm=NONE guifg=NONE
    " hi Folded ctermbg=242

  " :Obsess [file_name] - create new session
  " :Obsess [dir_name] - create new session under dir_name/Session.vim
  " :Obsess if session is tracked, pause tracking
  " :Obsess! - stop recording the session
  " Load the session:
  "   vim -S session_file - load the session
  "   OR
  "   :source session_file
  "
  " Active session is auto-saved on exist or on layout changes.
  Plug 'tpope/vim-obsession'

  " Interactive scratchpad for python / node / coffee / haskell / ruby / ocaml
  " / r / closure / php
  " PHP requires psysh
  " Codi [filetype] activates Codi for the current buffer, using the provided filetype or the buffer's filetype.
  " Codi! deactivates Codi for the current buffer.
  " Codi!! [filetype] toggles Codi for the current buffer.
  " Plus there is a shell-wrapper (in ~/.zshrc, call with code [filetype] [filename]
  Plug 'metakirby5/codi.vim'

  Plug 'Shougo/neomru.vim'
  let g:neomru#file_mru_path = $HOME . '/.vim/tmp/cache/neomru/file'
  let g:neomru#directory_mru_path = $HOME . '/.vim/tmp/cache/neomru/directory'

  source ~/.vim/.vimrc.fzf
  source ~/.vim/.vimrc.git-and-diff
  source ~/.vim/.vimrc.ide
  source ~/.vim/.vimrc.tools
  source ~/.vim/.vimrc.text
  source ~/.vim/.vimrc.search
  source ~/.vim/.vimrc.db
  source ~/.vim/.vimrc.colors

  " gcc - comment out line
  " gc<motion> - comment out lines defined by motion
  Plug 'tpope/vim-commentary'

  " :PP: Pretty print. With no argument, acts as a REPL.
  " :Runtime: Reload runtime files. Like :runtime!, but it unlets any include guards first.
  " :Disarm: Remove a runtime file's maps, commands, and autocommands, effectively disabling it.
  " :Scriptnames: Load :scriptnames into the quickfix list.
  " :Verbose: Capture the output of a :verbose invocation into the preview window.
  " :Time: Measure how long a command takes.
  " :Breakadd: Like its lowercase cousin, but makes it much easier to set breakpoints inside functions. Also :Breakdel.
  " :Vedit: Edit a file relative the runtime path. For example, :Vedit plugin/scriptease.vim. Also, :Vsplit, :Vtabedit, etc. Extracted from pathogen.vim.
  " K: Look up the :help for the VimL construct under the cursor.
  " zS: Show the active syntax highlighting groups under the cursor.
  " g!: Eval a motion or selection as VimL and replace it with the result.
  "     This is handy for doing math, even outside of VimL. It's so handy, in fact, that it probably deserves its own plugin.
  Plug 'tpope/vim-scriptease'

  call plug#end()

" if has('nvim')
"   " For nvim
"   augroup NvimColors
"     autocmd!
"     autocmd VimEnter * call SetupColorscheme()
"   augroup END
" else
"   " For vim
"   call SetupColorscheme()
" endif
call SetupColorscheme()

  "set runtimepath+=~/.vim/bundle/potion
" }}}

" Basics {{{

  filetype plugin indent on " load filetype plugins/indent settings

  set lazyredraw
  syntax on                  " Turn syntax highlighting on.
  set hidden                 " Can change buffers without saving

  set nobackup
  set noswapfile

  " try to create undo dir, skip error if exists
  silent !mkdir ~/.vim/tmp > /dev/null 2>&1
  silent !mkdir ~/.vim/tmp/undo > /dev/null 2>&1

  set undodir=~/.vim/tmp/undo/
  set undofile
  set undolevels=1000
  set undoreload=10000

  " $ - show '$' at the end of text we are going to change with 'c' command
  set cpoptions+=$

  " GUI Settings {{{
  if has("gui_running")
      " use simple dialogs rather than pop-ups
      set guioptions+=c
      " do not use GUI tabs, use console style tabs
      set guioptions-=e
      set guioptions-=T
      set guioptions-=m
      set guioptions-=r

      "set guifont=* to display font chooser
      set guifont=Droid\ Sans\ Mono\ 13
      " set guifont=Ubuntu\ Mono\ 13
      " set guifont=Monospace\ 11
  endif
  " }}}

" }}}

" Native files / buffers navigation
" Also need `set path=.,**` (see below) to search recursively
" See:http://www.reddit.com/r/vim/comments/2ueu0g/which_pluginskeybindsetc_significantly_changed/
" noremap <Leader>i :find<SPACE>
" noremap <Leader>I :find <C-R>=expand('%:p:h').'/**/*'<CR>
" Insert current file's folder
cnoremap <Leader><Leader>fn <C-r>=expand('%')<CR>
cnoremap <Leader><Leader>f <C-r>=expand('%:p:h')<CR>
" will expand %% to current file path
"cabbr <expr> %% expand('%:p:h')
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
" list buffers and start completion
nnoremap <Leader>b :buffer <C-z>
nnoremap <Leader>B :sbuffer <C-z>
" list buffers with ls and start completion
" see: http://www.reddit.com/r/vim/comments/2ueu0g/which_pluginskeybindsetc_significantly_changed/
nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:sbuffer<Space>

" Auto-read and auto-write {{{
  if !&diff
    set autoread
    "See http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work
    augroup checktime
      au!
      if !has("gui_running")
          "silent! necessary otherwise throws errors when using command
          "line window.
          autocmd BufEnter        * silent! checktime
          autocmd CursorHold      * silent! checktime
          autocmd CursorHoldI     * silent! checktime
          "these two _may_ slow things down. Remove if they do.
          "autocmd CursorMoved     * silent! checktime
          "autocmd CursorMovedI    * silent! checktime
      endif
    augroup END
    au FocusGained,BufEnter * :silent! !

    set autowrite
    "au FocusLost,WinLeave * :silent! w
    " See https://github.com/907th/vim-auto-save/
    function! DoAutosave()
      " expand('%') != '' - if this is new buffer without name
      " filereadable(expand('%')) - if this is new not saved buffer (like :e newfile)
      " expand('%') != '[Command Line]' - command line buffer
      if expand('%') != '' && filereadable(expand('%')) && expand('%') != '[Command Line]'
        update
      endif
    endfunction
    " autowrite on leave the insert mode, focus load and cursor hold
    augroup MyAutoCmdAutosave
      autocmd!
      "autocmd InsertLeave,CursorHold,CursorHoldI * call DoAutosave()
      autocmd FocusLost,WinLeave   * call DoAutosave()
    augroup END
  endif
" }}}

" Spell {{{
    " enable spell by default
    " actually recommended way is to enable spell
    " setlocal spell spelllang=en_us
    "set spell spelllang=ru_ru,en_us
    set spelllang=en_us
    " z= - suggest word
    " [s - previous wrong word
    " ]s - next wrong word
" }}}

" General {{{
  set mouse=a                 " use mouse everywhere
  set mousemodel=popup        " right mouse btn=popup, select=Shift+left btn
  set mousehide               " hide mouse when typing

  set noerrorbells            " don't make noise
  set novisualbell            " don't blink
  set t_vb=

  " Key to expand cmd completion inside macros / mappings
  set wildcharm=<C-Z>
  " ignore these list file extensions
  set wildignore+=*.swp,*.bak
  set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
  set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
  set wildignore+=*/min/*,*/vendor/*
  set wildignore+=tags,cscope.*
  set wildignore+=*.tar.*
  set wildignorecase
  "set wildmode=longest,list
  set wildmode=list,full
" }}}

" Langs and encodings {{{
  set fileformats=unix,dos,mac " support all three, in this order

  " Default text encoding
  if has('win32') || has('win64')
    set encoding=utf8
  elseif has('unix')
    set encoding=utf8
  endif

  set fileencodings=utf-8,cp1251,8bit-cp866

  "set langmap=Ж:,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,б\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~

  " set keymap=russian-jcukenwin
  " Make normal-mode keys work in russian
  "set iskeyword=@,48-57,_,192-255 "this is default
  " (XXX: #VIM/tpope warns the line below could break things)
  "?? set iskeyword+=_,$,@,%,# " none of these are word dividers
  " this allow to treat underscore (_) as word boundary
  "set iskeyword-=_

  set iminsert=0              " latin langmap by default when typing
  set imsearch=0              " latin langmap by default when search

  " Use English messages instead of translations
  language messages C
" }}}

" Search {{{
  set hlsearch               " highlight search
  set ignorecase             " case insensitive by default
  set smartcase              " if there are caps, go case-sensitive
" }}}

" Vim UI {{{
  set cursorline             " highlight current line
  set guicursor=n:blinkon0   " turn off cursor blinking

  set wrap                   " wrap text, see http://vimcasts.org/episodes/soft-wrapping-text/
  set linebreak              " do not wrap in the middle of the word

  set list                   " we do what to show tabs, to ensure we get them
                            " out of my files
  set listchars=tab:>-,trail:- " show tabs and trailing
  if has("gui_running")
    set listchars=tab:▸\ ,trail:·",eol:¶,extends:»,precedes:«
    set showbreak=-
  else
    set listchars=tab:»\ ,trail:·",eol:¬,extends:❯,precedes:❮
    set showbreak=↪
  endif
  if has("linebreak")
    let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
  endif
  if has("balloon_eval") && has("unix")
    set ballooneval
  endif
  "Invisible character colors
  highlight NonText guifg=#4a4a59
  highlight SpecialKey guifg=#4a4a59

  "For gitgutter, to make the sign column to be the same as line numbers
  "column
  highlight clear SignColumn

  set nostartofline          " leave my cursor where it was

  set relativenumber         " both relative and number (for current line)
  set number                 " turn on line numbers
  set numberwidth=5          " We are good up to 99999 lines
  set report=0               " tell us when anything is changed via :...
  set showmode               " Show editing mode

  "set scrolloff=10          " Keep 10 lines (top/bottom) for scope
  set scrolloff=999          " Work line is always in the middle
                            " alternative: zz - centers current line
  set sidescroll=1           " smooth horizontal scrolling
  set sidescrolloff=10       " Keep 5 lines at the size

  set shortmess=aOstT        " shortens messages to avoid
                            " 'press a key' prompt
  set statusline=[%n]%{fugitive#statusline()}%{coc#status()}%F\ %m%r%h%w\ [%L]\ [%{&ff}]%y%=[%p%%][%04l,%04v]
  "                |                         |   | | | |    |     |      |     |     |    |
  "                |                         |   | | | |    |     |      |     |     |    + current
  "                |                         |   | | | |    |     |      |     |     |       column
  "                |                         |   | | | |    |     |      |     |     +-- current line
  "                |                         |   | | | |    |     |      |     +-- current % into file
  "                |                         |   | | | |    |     |      +-- current syntax in
  "                |                         |   | | | |    |     |          square brackets
  "                |                         |   | | | |    |     +-- current fileformat
  "                |                         |   | | | |    +-- number of lines
  "                |                         |   | | | +-- preview flag in square brackets
  "                |                         |   | | +-- help flag in square brackets
  "                |                         |   | +-- readonly flag in square brackets
  "                |                         |   +-- modified flag in square brackets
  "                |                         +-- full path to file in the buffer
  "                +-- buffer number

" }}}

" Text Formatting/Layout {{{
  set expandtab               " expand tabs to spaces
  set shiftwidth=4            " auto-indent amount when using cindent,
                              " >>, << and stuff like that
  set softtabstop=4           " when hitting tab or backspace, how many spaces
                              " should a tab be (see expandtab)
  set tabstop=4               " real tabs will show with set list on

  set formatoptions-=t        " Do not automatically wrap text on textwidth
  set formatoptions+=crq      " Automatically insert comment leader on return,
                              " and let gq format comments

  set infercase               " case inferred by default

  set smartindent             " smart indenting when starting a new line (after {, before }, etc)
  " Virtual editing means that the cursor can be positioned where there is
  " no actual character.  This can be halfway into a tab or beyond the end
  " of the line.  Useful for selecting a rectangle in Visual mode and
  " editing a table.
  set virtualedit=all
" }}}

" Folding {{{
  " " Make zO recursively open whatever fold we're in, even if it's partially open.
  " nnoremap zO zczO
  "
  " " "Focus" the current line.  Basically:
  " "
  " " 1. Close all folds.
  " " 2. Open just the folds containing the current line.
  " " 3. Move the line to a little bit (15 lines) above the center of the screen.
  " " 4. Pulse the cursor line.  My eyes are bad.
  " "
  " " This mapping wipes out the z mark, which I never use.
  " "
  " " I use :sus for the rare times I want to actually background Vim.
  " nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

" }}}

" Completions {{{
  "set completeopt=longest,menuone,preview " use a pop up menu for completions
  set completeopt=menuone,longest,preview " use a pop up menu for completions
  set complete=""             " what use for completions
  set complete+=.             " current buffer
  set complete+=t             " tags
  set complete+=kspell        " dictionary
  set complete+=b             " other open buffers

  " tag files
  " ';/' - this will look in the current directory for "tags", and work up the tree
  " towards root until one is found
  " set tags=tags;/
" }}}

" Autocommands {{{
  " MyAutoCmd : an augroup for my autocmd
  augroup MyAutoCmd
    autocmd!

    autocmd BufRead,BufNewFile *.js      set filetype=javascript
    autocmd BufRead,BufNewFile *.ejs     set filetype=html
    autocmd BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
    autocmd BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
    autocmd BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

    " S-k to open help
    autocmd BufNewFile,Bufread *.php set keywordprg="help"

    " there is a problem with hash (#) indentation - it always shifted
    " to the start of the string
    " see http://stackoverflow.com/questions/354097/how-to-configure-vim-to-not-put-comments-at-the-beginning-of-lines-while-editing
    autocmd FileType python :set nosmartindent
    autocmd FileType python :set cindent

    autocmd FileType html :set filetype=xhtml

    autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
    autocmd FileType gitcommit setlocal spell
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown :set nosmartindent

  augroup END

  " see https://github.com/romainl/vim-qf for more
  augroup autoquickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
  augroup END

  command! -bar -nargs=? -bang Scratch :silent enew<bang>|set buftype=nofile bufhidden=hide noswapfile buflisted filetype=<args> modifiable

" }}}

" Mappings {{{
  "let mapleader = ","
  "let mapleader = "\<space>"
  " Better then let mapleader because vim command line will still
  " display leader-based mappings as \s
  " From http://www.reddit.com/r/vim/comments/1vdrxg/space_is_a_big_key_what_do_you_map_it_to/
  map <space> <leader>

  " * and # will stay on the first match
  nnoremap * *N
  nnoremap # #N

  " Use CTRL-N to remove search highlight
  noremap <C-N> :noh \| call clearmatches()<CR>
  vnoremap <C-N> <C-C>:noh \| call clearmatches()<CR>gv
  " CTRL-N in insert mode is a completion!!!
  " inoremap <C-N> <C-O>:noh<CR>

  " Repeat change on word
  " Set cursor over a word, <leader>c - change it,
  " now '.' will repeat the change on the next word, n - skip the next word
  nnoremap <leader>c *Ncgn

  " Note: to replace something with yanked text it's easy to use
  " a change operation and then <C-R>0 to insert register '0' content
  " in insert mode, like cw<C-R>0 - replace  a word with yanked text

  " save
  noremap <leader>w :w<CR>
  noremap <leader>q :q<CR>

  " jj or j+k as ESC
  " other options: Ctrl-[, Ctrl-C
  inoremap jj <Esc>
  inoremap jk <Esc>
  inoremap kj <Esc>

  "runtime macros/matchit.vim
  " Tab to move between matches
  " Notes regarding %:
  " - for parentesis () it works for next pair on the current line, so
  "     function name(arg1, arg2)
  "               ^--- cursor here, % will jump to )
  " - and c% will change to the ), useful in such case:
  "     my_fun(arg1, func2(arg1, arg2, fun3(arg3)))
  "                  ^- cursor here, c% will change inside the my_fun brackets
  " See: http://www.viemu.com/a-why-vi-vim.html
  "      http://thepugautomatic.com/2014/03/vims-life-changing-c-percent/
  " nnoremap <Leader><Leader> %

  " Make last word uppercase
  inoremap <C-F> <Esc>gUiw`]a

  " ,o to insert a new line below, ,O - above
  " (in normal mode and go back to normal)
  nnoremap <Leader>o o<Esc>
  nnoremap <Leader>O O<Esc>

  "note: "+ - real clipboard, "* - current selection
  "note: p - paste after cursor, P - before
  "      gp - cursor will be after pasted text
  "           with just p - on the last pasted char
  nnoremap <Leader>y "+y
  vnoremap <Leader>y "+y
  nnoremap <Leader>p "+p
  vnoremap <Leader>p "+p
  nnoremap <Leader>P "+P
  vnoremap <Leader>P "+P

  " Move cursor by display lines when wrapping
  " http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
  " noremap k gk
  " noremap j gj
  " noremap gk k
  " noremap gj j
  "noremap 0 g0
  "noremap $ g$

  " Shortcut to rapidly toggle `set list` (def leader = \)
  " :list displays tabs, trailing spaces and other "invisible" chars
  " nnoremap <leader>l :set list!<CR>

  " Put ending { to the next line
  function! ClosingBracketToNextLine()
    normal g$F{i
  endfunction
  "nmap <leader>bn :call ClosingBracketToNextLine()<CR>

  " Standard keys
  " Speller shorcuts
  " z= - suggest word
  " [s - previous wrong word
  " ]s - next wrong word

  " History
  " http://vim.wikia.com/wiki/Using_command-line_history
  " q: for commands
  " q/ for searches
  " or type : or / to start entering a command or search,
  " then press the 'cedit' key (default is Ctrl-f :help 'cedit').

  " gv - select last visual area and go to visual mode
  " Visually select the text that was last edited/pasted
  nnoremap gV `[v`]

  " Don't move the cursor after yanking the visual selection
  " (usually it jumps back to the start of the selection)
  " http://ddrscott.github.io/blog/2016/yank-without-jank/
  vnoremap <expr>y "my\"" . v:register . "y`y"
  " Y will yank line-wise even if you have character-wise selection
  vnoremap <expr>Y "my\"" . v:register . "Y`y"

  nnoremap gl :call ToggleRelativeAbsoluteNumber()<CR>
  function! ToggleRelativeAbsoluteNumber()
    if &relativenumber
      set norelativenumber
    else
      set relativenumber
    endif
  endfunction

  " ,vv to re-read .vimrc
  nnoremap <Leader>vv :call Preserve("source ".$MYVIMRC)<CR>
  " ,vc to edit .vimrc
  "nnoremap <leader>vc :tabedit $MYVIMRC<CR>
  nnoremap <leader>vc :tabedit $HOME/.vim/.vimrc<CR>
" }}}

" Windows navigation {{{

  " C-W h|j|k|l   - move to left|down|up|right win
  " v C-W h|j|k|l - split to left|down|up|right win
  " C-W w         - cycle
  " C-W s|v       - split current win horiz | vert
  " :on[ly]       - leave only current win
  " C-W +|-       - height +|- 1 px
  " C-W >         - increase current window width N columns
  " C-W _||       - maximize height|width
  " moving windows:
  " C-W H|J|K|L   - move win to the left|down|up|right
  " C-W r         - rotate
  " C-W x         - exchange with neighbour
  " C-W T         - move window to separate tab
  " C-W P         - go to preview window
  " C-W z         - close preview window
  "
  " Window swap plugin: <leader>ww in first window and
  "                     then <leader>ww in second to
  "                     swap them.

  " move to and open if not exists
  " http://www.agillo.net/simple-vim-window-management/
  function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr()) "we havent moved
      if (match(a:key,'[jk]')) "were we going up/down
        wincmd v
      else
        wincmd s
      endif
      exec "wincmd ".a:key
    endif
  endfunction

  " See also an alternative approach to windows navigation
  " using submode plugin: http://ddrscott.github.io/blog/2016/making-a-window-submode/
  " The plugin: https://github.com/kana/vim-submode
  " Basically, the idea is that Ctrl-W starts the sumbode and then you just
  " use h/j/k/l and other keys without prefixing each one with Ctrl-W

  " move to and open if not exists
  map <c-j> :call WinMove('j')<CR>
  map <c-k> :call WinMove('k')<CR>
  map <c-l> :call WinMove('l')<CR>
  map <c-h> :call WinMove('h')<CR>
  if has('nvim')
    " Testing, map jk/kj as Esc
    " Map Ctrl + h,j,k,l to move between windows
    " And map Alt + h,j,k,l for the same
    " now it is possible to map Alt in terminal
    " see also :help nvim-terminal-emulator
    :tnoremap jk <C-\><C-n>
    :tnoremap kj <C-\><C-n>
    :tnoremap <C-h> <C-\><C-n>:call WinMove('h')<CR>
    :tnoremap <C-j> <C-\><C-n>:call WinMove('j')<CR>
    :tnoremap <C-k> <C-\><C-n>:call WinMove('j')<CR>
    :tnoremap <C-l> <C-\><C-n>:call WinMove('j')<CR>
    :tnoremap <A-h> <C-\><C-n>:call WinMove('h')<CR>
    :tnoremap <A-j> <C-\><C-n>:call WinMove('j')<CR>
    :tnoremap <A-k> <C-\><C-n>:call WinMove('j')<CR>
    :tnoremap <A-l> <C-\><C-n>:call WinMove('j')<CR>
    :nnoremap <A-h> :call WinMove('h')<CR>
    :nnoremap <A-j> :call WinMove('j')<CR>
    :nnoremap <A-k> :call WinMove('k')<CR>
    :nnoremap <A-l> :call WinMove('l')<CR>
  endif

  "rotate
  map <leader>wr <C-W>r

  "arrows to resize
  nmap <left>  :3wincmd <<cr>
  nmap <right> :3wincmd ><cr>
  nmap <up>    :3wincmd +<cr>
  nmap <down>  :3wincmd -<cr>

  "move windows
  map <Leader>h     :wincmd H<cr>
  map <Leader>k     :wincmd K<cr>
  map <Leader>l     :wincmd L<cr>
  map <Leader>j     :wincmd J<cr>

  " format json, see https://coderwall.com/p/faceag
  " :%!python -m json.tool
  " or with jq http://stedolan.github.io/jq/
  "   download, mv to ~/bin/jq, chmod +x ~/bin/jq
  " :%!jq '.'

" }}}

" Save and launch vim {{{
  " default: '100,<50,s10,h
  " NOTE: ! is necessary in order to be able to restore last session
  set viminfo=!,'100,/50,:50,<50,@50


  function! LoadLocalVimrc()
    " :Rooter
    " Use with :find - it will search subdirectories
    set path=.,**
    " Check for .vimrc.local in the current directory
    let custom_config_file = getcwd() . '/.vimrc.local'
    if filereadable(custom_config_file)
      exe 'source' custom_config_file
    else
      let custom_config_file = getcwd() . '/.git/.vimrc.local'
      if filereadable(custom_config_file)
        exe 'source' custom_config_file
      endif
    endif
  endfunction

  autocmd MyAutoCmd BufWinEnter *  call LoadLocalVimrc()

  " execute a command while preserve the position
  if !exists("*Preserve")
    function! Preserve(command)
      " Preparation: save last search, and cursor position.
      let _s=@/
      let l = line(".")
      let c = col(".")
      " Do the business:
      execute a:command
      " Clean up: restore previous search history, and cursor position
      let @/=_s
      call cursor(l, c)
    endfunction
  endif

  " remove trailing whitespace on save
  " new version from http://vimcasts.org/episodes/tidying-whitespace/
  let g:clean_trails_enabled = 0
  function! CleanTrails()
    if g:clean_trails_enabled
      call Preserve("%s/\\s\\+$//e")
    endif
  endfunction

  autocmd MyAutoCmd FileType c,cpp,java,php,python,vim,text,markdown,javascript,xhtml,sql autocmd MyAutoCmd BufWritePre <buffer>
    \ call CleanTrails()

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event
  " handler.
  autocmd MyAutoCmd BufReadPost *
    \ if line("'\"") > 0 |
    \   if line("'\"") <= line("$") |
    \     exe("norm '\"") |
    \   else |
    \     exe "norm $" |
    \   endif|
    \ endif

  set sessionoptions=buffers,curdir,help,winsize " localoptions,
" }}}


" Password generator, :echo Password() or Ctrl-R=Password()
function! RandNum() abort
  return str2nr(matchstr(reltimestr(reltime()), '\.\zs\d*'))
endfunction

function! RandChar() abort
  return nr2char((RandNum() % 93) + 33)
endfunction

function! Password() abort
  return join(map(range(8), 'RandChar()'), '')
endfunction

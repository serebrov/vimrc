" Bundles {{{
  set nocompatible " explicitly get out of vi-compatible mode
  filetype off

  " neobundle {{{
    if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif

    call neobundle#rc(expand('~/.vim/bundle/'))

    " Let NeoBundle manage NeoBundle
    NeoBundleFetch 'Shougo/neobundle.vim'
    " for YouCompleteMe - it takes a long time to install
    let g:neobundle#install_process_timeout = 600

    " Brief help
    " :NeoBundleList          - list configured bundles
    " :NeoBundleInstall(!)    - install(update) bundles
    " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
  " }}}

  """""" UI
  " sensible defaults
  NeoBundle 'tpope/vim-sensible'
  " auto adjust tab/space settings based on current file
  NeoBundle 'tpope/vim-sleuth'
  " Additional features for netrw
  " - to open browser focused on current file, - again to go upper
  " . to put selected file name to the end of command line; ! to do the
  " same and start command line with !
  " ~ - go home; cd/cl - :cd / :lcd
  " NeoBundle 'tpope/vim-vinegar'
  NeoBundle 'serebrov/vim-vinegar'
  " visual guides for indents, :IndentLinesToggle
  NeoBundle 'Yggdroot/indentLine'
  " automatically switches to relative numbers when go to normal mode
  "NeoBundle 'myusuf3/numbers.vim.git'
  " :Matchmaker to enable dynamic highlighting of the word under the
  " cursor (move the cursor and it will highlight the different word)
  " :Matchmaker! to turn it off
  NeoBundle 'qstrahl/vim-matchmaker'
  " At every search command, it automatically prints
  " "At match #N out of M matches".
  NeoBundle 'IndexedSearch'
  " rainbow parenthesis
  " Note: doesn't work for php due some specifics in the syntax file
  " it doesn't work with default syntax file and with extended versions
  " (https://github.com/vim-scripts/php.vim--Garvin) and (https://github.com/StanAngeloff/php.vim)
  " maybe this can be fixed?
  " see https://defuse.ca/blog/vim-rainbow-parentheses-work-in-php
  NeoBundle 'kien/rainbow_parentheses.vim'
  NeoBundle 'kien/ctrlp.vim'
  " Powerline - create better-looking, more functional vim statuslines.
  "NeoBundle 'Lokaltog/vim-powerline'
  NeoBundle 'bling/vim-airline'
  " adopt color schemes for terminal
  NeoBundle 'godlygeek/csapprox'
  " Solarized color scheme
  NeoBundle 'altercation/vim-colors-solarized'
  "NeoBundle 'nelstrom/vim-mac-classic-theme'
  "NeoBundle 'morhetz/gruvbox'
  "NeoBundle 'sjl/badwolf'
  "NeoBundle 'lsdr/monokai'

  "ensure dir exists before save the file
  "so :e some_new_dir/some_new_file and then :w will work
  NeoBundle 'dockyard/vim-easydir'

  """""" Git
  " git support: Gedit, Gdiff, Gstatus, Gcommit, Gblame, Gmove, Gremove
  " Ggrep, Glog, Gread, Gwrite, Gbrowse
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'gregsexton/gitv'
  " fugitive extension, commit browser - :Extradite
  NeoBundle 'int3/vim-extradite'
  " see http://sjl.bitbucket.org/splice.vim/
  "NeoBundle 'sjl/splice.vim'
  "Shows +/- for git changes
  "NeoBundle 'airblade/vim-gitgutter'

  """""" Motions / normal mode commands
  " Simpler way to use some motions in vim.
  " Start motion with <Leader><Leader>
  " Like <Space>w to trigger the word motion w
  " Other triggers: f/t/F/T (find char), w/W/b/B/e/E/ge/gE (word motions), j/k (lines), n/N (searches)
  " Tutorial: http://net.tutsplus.com/tutorials/other/vim-essential-plugin-easymotion/
  " It is similar to vimperator (FireFox extenstion) link select mode
  NeoBundle 'Lokaltog/vim-easymotion'
  " CamelCase and under_score motions: ,w ,b ,e and i,w i,b i,e
  NeoBundle 'bkad/CamelCaseMotion'
  " av: around variable
  " iv: inner variable
  NeoBundle 'robmiller/vim-movar'
  " Change surrounding objects
  " cs<from><to> - change surrounding
  " cs"' - change surround " to '
  " cs'<q> - change surround ' to <q>..</q>
  " cst" - chage surrounding tag to "
  " ds<what> - remove surrounding
  " ds" - remove surrounding "
  " ys<motion><what> - add surrounding
  " ysiw] - add surrounding [] for inner word
  " yssb or yss) - surround a line with ()
  " in visual mode S<what> will surround selected text
  NeoBundle 'tpope/vim-surround'
  " Required by vim-surround
  NeoBundle 'tpope/vim-repeat'
  " Pair commands, some of them:
  " [q / ]q, [Q / ]Q- :cprevious / :cnext, :cfirst / :clast - errors in quickfix
  " [l / l], [L / L] - :lprevious / :lnext, :lfirst / :llast  - errors in current window (?)
  " [<C-Q> / ]<C-Q> - :cpfile / :cnfile - errors in files (?)
  " [<C-L] / ]<C-L> - :lpfile / :lnfile - errors in files, use current window (?)
  " [t / ]t, [T / ]T - :tprevious / :tnext, :tfirst / :tlast - tags
  " [a / ]a, [A / ]A  - :previous / :next, :first / :last - files in argument list
  " [b / ]b, [B / ]b  - :bprevious / :bnext, :bfirst / :blast - buffers
  "
  " [Space - add [count] blank lines before cursor
  " ]Space - add [count] blank lines after cursor
  " [e - move line up
  " ]e - move line down
  "
  " [f / ]f - previous / next file in directory
  " [n / ]b - previous / next conflict marker
  NeoBundle 'tpope/vim-unimpaired'
  " Commenting code
  " <Leader>cc - comment line or selected text
  " <Leader>cu - uncomment line or selected text
  " <Leader>cm - comment with multiline /* */ comments
  " <Leader>cs - 'sexy' comments
  " <Leader>c<space> - toggle comments state, see more in help
  "NeoBundle 'scrooloose/nerdcommenter'

  " gcc - comment out line
  " gc<motion> - comment out lines defined by motion
  NeoBundle 'tpope/vim-commentary'

  """""" Commands
  "Vim sugar for the UNIX shell commands that need it the most. Commands include:
  " :Unlink: Delete a buffer and the file on disk simultaneously.
  " :Remove: Like :Unlink, but doesn't require a neckbeard.
  " :Move: Rename a buffer and the file on disk simultaneously.
  " :Chmod: Change the permissions of the current file.
  " :Find: Run find and load the results into the quickfix list.
  " :Locate: Run locate and load the results into the quickfix list.
  " :SudoWrite: Write a privileged file with sudo.
  " :W: Write every open window. Handy for kicking off tools like guard.
  NeoBundle 'tpope/vim-eunuch'
  " :Tabularize /, - tablarize by ','
  " :Tabularize /,/[r|l|c]0
  "  r - align right, l - left, c - center
  "  0 (or other number) - number of spaces between fields
  " :Tabularize /,/r1c1l0
  "  formatters will be applied in the specified order
  " :Tabularize /^[^,]*\zs,/r0c0l0 - use regex ^[^,]*\zs, (match only first comma)
  " :AddTabularPattern first_comma /^[^,]*\zs,/r0c0l0 - save pattern
  " (:Tab first_comma)
  " Standard extensions (after/plugin/TabularMaps.vim)
  "  assignment, two_spaces, multiple_spaces, argument_list,
  "  split_declarations, trenary_operator, cpp_io, pascal_assign,
  "  trailing_c_comments
  NeoBundle 'godlygeek/tabular'
  " :Multichange and then cw to change word in a whole file (or any
  " other cxx command)
  " command line results into buffer, like :Clam ls,
  " :1,20Clam python - send first 20 lines into python
  NeoBundle 'sjl/clam.vim'
    " Gundo.vim is Vim plugin to visualize your Vim undo tree.
  NeoBundle 'sjl/gundo.vim'
  " adds a Bundles menu to Vim, displaying the installed plugins and the features they provide
  NeoBundle 'Headlights'
  " :Multichange to enter multichange mode (cw will affect the whole file)
  NeoBundle 'AndrewRadev/multichange.vim'
  " disable mapping entirely
  let g:multichange_mapping = ''

  """""" Programming / tags / autocomplete
  " Syntax checker
  NeoBundle 'scrooloose/syntastic'
  " fetching can take a long time causing the timeout
  " to manually install it
  "   git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
  NeoBundle "Valloric/YouCompleteMe", {"build": {
      \ "mac": "./install.sh --clang-completer",
      \ "unix": "./install.sh --clang-completer"
      \ }}
  NeoBundle 'UltiSnips'
  NeoBundle 'ervandew/supertab'
  NeoBundle 'joonty/vdebug'
  NeoBundle 'joonty/vim-taggatron'
  NeoBundle 'airblade/vim-rooter'
  " https://github.com/majutsushi/tagbar/wiki
  " http://majutsushi.github.com/tagbar/
  " :TagbarToggle
  NeoBundle 'majutsushi/tagbar'
  " autoinsert pair symbols (such as brackets)
  " disable because it breaks dot(.) - it repeats only what was entered
  " inside the paired symbols, not the whole text
  " https://github.com/kana/vim-smartinput/issues/33
  "NeoBundle 'kana/vim-smartinput'

  """""" Db
  NeoBundle 'loki-nkl/vim-mysql-mode'
  NeoBundle 'vim-scripts/dbext.vim'

  """""" Unite and vimproc
  " NeoBundle 'Shougo/vimproc', { 'build': {
  "       \   'windows': 'make -f make_mingw32.mak',
  "       \   'cygwin': 'make -f make_cygwin.mak',
  "       \   'mac': 'make -f make_mac.mak',
  "       \   'unix': 'make -f make_unix.mak',
  "       \ } }
  " NeoBundle 'Shougo/unite.vim'
  " "https://github.com/Shougo/unite.vim/wiki/unite-plugins
  " NeoBundle 'Shougo/unite-outline'
  " NeoBundle 'Shougo/unite-help'
  " NeoBundle 'thinca/vim-unite-history'
  " NeoBundle 'sgur/unite-git_grep'

  " NeoBundle 'Shougo/vimshell'

  """""" Markdown
  NeoBundle 'tpope/vim-markdown'
  " Markup files preview: <Leader>P
  NeoBundle 'greyblake/vim-preview'
  NeoBundle 'suan/vim-instant-markdown'

  """""" PHP
  " php completion - it should be copied to autoload/phpcomplete.vim
  NeoBundle 'shawncplus/phpcomplete.vim'
  " php 5.3 syntax
  NeoBundle 'StanAngeloff/php.vim'
  NeoBundle '2072/PHP-Indenting-for-VIm'
  " view php docs with K
  NeoBundle 'mudpile45/vim-phpdoc'
  NeoBundle 'mikehaertl/yii-api-vim'
  " php documenter
  NeoBundle 'mikehaertl/pdv-standalone'

  """""" Javascript
  NeoBundle 'jelera/vim-javascript-syntax'
  NeoBundle 'itspriddle/vim-jquery.git'
  " ejs templates syntax highlight
  NeoBundle 'briancollins/vim-jst.git'
  NeoBundle 'heavenshell/vim-jsdoc'

  set runtimepath+=~/.vim/bundle/potion
" }}}

" Basics {{{

  filetype plugin indent on " load filetype plugins/indent settings
  " Installation check.
  NeoBundleCheck

  set lazyredraw
  syntax on                  " Turn syntax highlighting on.
  set hidden                 " Can change buffers without saving

  set nobackup
  set noswapfile

  " try to create undo dir, skip error if exists
  silent !mkdir ~/.vim/tmp > /dev/null 2>&1
  silent !mkdir ~/.vim/tmp/undo > /dev/null 2>&1
  "silent !mkdir ~/.vim/tmp/unite > /dev/null 2>&1

  set undodir=~/.vim/tmp/undo/
  set undofile
  set undolevels=1000
  set undoreload=10000

  set autowrite

  " Colors {{{
      set background=dark
      if $COLORTERM == 'gnome-terminal'
          " tell vim that gnome terminal supports 256 colors
          set t_Co=256
          let g:solarized_termcolors=256
      endif
      " Solarized {{{
          let g:solarized_contrast="high"    "default value is normal
          let g:solarized_diffmode="high"    "default value is normal
          try
              colorscheme solarized
          catch /^Vim\%((\a\+)\)\=:E185/
              echo "Solarized theme not found. Run :BundleInstall"
          endtry
      " }}}
      "colorscheme wombat
      "colorscheme gruvbox
  " }}}

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
      "set guifont=Inconsolata\ Medium\ 12
      "set guifont=Liberation\ Mono\ 10
  endif
  " }}}

" }}}

" Spell {{{
    " enable spell by default
    " actually recommended way is to enable spell
    " setlocal spell spelllang=en_us
    "set spell spelllang=ru_ru,en_us
    set spell spelllang=en_us
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

  " ignore these list file extensions
  set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
  " set wildmode=longest,list
  set wildmode=longest:full,full
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

  set keymap=russian-jcukenwin
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

  set nostartofline          " leave my cursor where it was

  set number                 " turn on line numbers
  set numberwidth=5          " We are good up to 99999 lines
  set report=0               " tell us when anything is changed via :...
  set showmode               " Show editing mode

  "set scrolloff=10          " Keep 10 lines (top/bottom) for scope
  set scrolloff=999          " Work line is always in the middle
                            " alternative: zz - centers current line
  set sidescrolloff=10       " Keep 5 lines at the size

  set shortmess=aOstT        " shortens messages to avoid
                            " 'press a key' prompt
  set statusline=[%n]%{fugitive#statusline()}%F\ %m%r%h%w\ [%L]\ [%{&ff}]%y%=[%p%%][%04l,%04v]
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
"
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
  " zf{motion} or {Visual}zf - create a manual fold
  " za - open/close current fold
  " zR - open all folds
  " zM - close all folds

  " enable folding by marker for vimrc
  augroup fold_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
  augroup END

  " set foldenable              " Turn on folding
  " set foldmarker={,}          " Fold C style code (only use this as default
  "                             " if you use a high foldlevel)
  " set foldmethod=marker       " Fold on the marker
  " set foldlevel=100           " Don't autofold anything (but I can still
  "                             " fold manually)
  " set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

  " " from https://github.com/sjl/dotfiles/blob/master/vim/.vimrc
  " function! MyFoldText()
  "     let line = getline(v:foldstart)

  "     let nucolwidth = &fdc + &number * &numberwidth
  "     let windowwidth = winwidth(0) - nucolwidth - 3
  "     let foldedlinecount = v:foldend - v:foldstart

  "     " expand tabs into spaces
  "     let onetab = strpart(' ', 0, &tabstop)
  "     let line = substitute(line, '\t', onetab, 'g')

  "     let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
  "     let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  "     return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
  " endfunction
  " set foldtext=MyFoldText()

" }}}

" Completions {{{
  set completeopt=longest,menuone,preview " use a pop up menu for completions
  set complete=""             " what use for completions
  set complete+=.             " current buffer
  set complete+=t             " tags
  set complete+=k             " dictionary
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

    "" use Leader-r to refresh (default is Ctrl-L which is used to jump
    "" to the left window)
    autocmd FileType netrw nnoremap <buffer> <Leader>r <Plug>NetrwRefresh
  augroup END

  function! DoAutosave()
    " expand('%') != '' - if this is new buffer without name
    " filereadable(expand('%')) - if this is new not saved buffer (like :e newfile)
    " expand('%') != '[Command Line]' - command line buffer
    if expand('%') != '' && filereadable(expand('%')) && expand('%') != '[Command Line]'
      update
    endif
  endfunction

  " autowrite on leave the insert mode
  augroup MyAutoCmdAutosave
    autocmd!

    autocmd InsertLeave * call DoAutosave()
    " autocmd FocusLost   * silent! wall test
    autocmd FocusLost   * call DoAutosave()
  augroup END

  augroup Rainbow
    autocmd!
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
  augroup END

  command! -bar -nargs=? -bang Scratch :silent enew<bang>|set buftype=nofile bufhidden=hide noswapfile buflisted filetype=<args> modifiable
  function! s:scratch_maps() abort
    nnoremap <silent> <buffer> == :Scratch<CR>
    nnoremap <silent> <buffer> =" :Scratch<Bar>put<Bar>1delete _<Bar>filetype detect<CR>
    nnoremap <silent> <buffer> =* :Scratch<Bar>put *<Bar>1delete _<Bar>filetype detect<CR>
    nnoremap          <buffer> =f :Scratch<Bar>setfiletype<Space>
  endfunction

  augroup TpopeMisc
    autocmd!

    autocmd FileType netrw nnoremap <buffer> gr :grep <C-R>=shellescape(fnamemodify(expand('%').'/'.getline('.'),':.'),1)<CR><Home><C-Right> -r<Space>
    autocmd FileType netrw call s:scratch_maps()
    autocmd FileType gitcommit if getline(1)[0] ==# '#' | call s:scratch_maps() | endif
    autocmd FocusGained * if !has('win32') | silent! call fugitive#reload_status() | endif
  augroup END

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
  let g:clean_trails_enabled = 1
  function! CleanTrails()
    if g:clean_trails_enabled
      call Preserve("%s/\\s\\+$//e")
    endif
  endfunction

  autocmd MyAutoCmd FileType c,cpp,java,php,python,vim,text,markdown,javascript,xhtml autocmd MyAutoCmd BufWritePre <buffer>
    \ call CleanTrails()
    "\ call Preserve("%s/\\s\\+$//e")

  " When editing a file, always jump to the last known cursor porition.
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
" }}}

" Plugins {{{

  let g:PreviewBrowsers='google-chrome'

  " Syntastic
  " set default standard for phpcs: sudo phpcs --config-set default_standard PSR2
  " it is also possible to configure options for each checker, see
  " syntastic helt - "syntastic-config-makeprg"
  let g:syntastic_check_on_open=0
  let g:syntastic_css_checkers = ['csslint']

  " save as sudo - use :SudoWrite from tpope/vim-eunuch
  "ca w!! w !sudo tee "%"

  let g:airline_theme='badwolf'
  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_linecolumn_prefix = '␊ '
  let g:airline_linecolumn_prefix = '␤ '
  let g:airline_linecolumn_prefix = '¶ '
  let g:airline_branch_prefix = '⎇ '
  let g:airline_paste_symbol = 'ρ'
  let g:airline_paste_symbol = 'Þ'
  let g:airline_paste_symbol = '∥'

  " it is too slow to have it enabled by default, use :IndentLinesToggle
  let g:indentLine_enabled = 0

  " phpDocumenter
  let g:pdv_cfg_Package = "app"
  let g:pdv_cfg_Version = ""
  let g:pdv_cfg_Author = "Boris Serebrov"
  let g:pdv_cfg_Copyright = ""
  let g:pdv_cfg_License = ""

  "JSDoc
  let g:jsdoc_default_mapping = 0

  augroup DocMap
    autocmd!

    autocmd FileType php inoremap <Leader>pd <ESC>:call PhpDocSingle()<CR>i
    autocmd FileType php nnoremap <Leader>pd :call PhpDocSingle()<CR>
    autocmd FileType php vnoremap <Leader>pd :call PhpDocRange()<CR>

    autocmd FileType javascript nnoremap <Leader>pd :JsDoc<CR>

  augroup END

" }}}

" Mappings {{{
  "let mapleader = ","
  let mapleader = "\<space>"

  " Swap ; and :, use ;; as ;
  "nnoremap ; :
  "nnoremap ;; ;

  " map double leader to save
  noremap <leader>w :w<CR>
  noremap <leader>q :q<CR>

  " jj or j+k as ESC
  " other options: Ctrl-[, Ctrl-C
  inoremap jj <Esc>
  inoremap jk <Esc>
  inoremap kj <Esc>

  " ,vv to re-read .vimrc
  nnoremap <Leader>vv :call Preserve("source ".$MYVIMRC)<CR>
  " ,vc to edit .vimrc
  nnoremap <leader>vc :tabedit $MYVIMRC<CR>

  " Use CTRL-N to remove search highlight
  noremap <C-N> :noh<CR>
  vnoremap <C-N> <C-C>:noh<CR>gv
  " CTRL-N in insert mode is a completion!!!
  " inoremap <C-N> <C-O>:noh<CR>

  " Make last word uppercase
  inoremap <C-F> <Esc>gUiw`]a

  " ,o to insert a new line below, ,O - above (in normal mode)
  nnoremap <Leader>o o<Esc>
  nnoremap <Leader>O O<Esc>

  nnoremap <Leader>y "+y
  vnoremap <Leader>y "+y
  nnoremap <Leader>p "+gP
  vnoremap <Leader>p "+gP

  " Use CTRL-S for saving, also in Insert mode
  " Note: see http://stackoverflow.com/questions/3446320/in-vim-how-to-map-save-to-ctrl-s
  " Ctrl-S is a common command to terminals to stop updating, it was a way to slow the output
  " so you could read it on terminals that didn't have a scrollback buffer.
  " First find out if you can configure your xterm to pass Ctrl-S through to the application.
  " BTW: if Ctrl-S freezes your terminal, type Ctrl-Q to get it going again.
  noremap <C-S> :update<CR>
  vnoremap <C-S> <C-C>:update<CR>gv
  inoremap <C-S> <C-O>:update<CR>
  "
  " Move cursor by display lines when wrapping
  " http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
  noremap k gk
  noremap j gj
  noremap gk k
  noremap gj j
  "noremap 0 g0
  "noremap $ g$

  " Move cursor with Ctrl + hjkl in Insert mode
  inoremap <C-h> <C-o>h
  inoremap <C-j> <C-o>j
  inoremap <C-k> <C-o>k
  inoremap <C-l> <C-o>l

  " Shortcut to rapidly toggle `set list` (def leader = \)
  nnoremap <leader>l :set list!<CR>

  " auto insert verymagic flag when search
  nnoremap / /\v

  " <Leader>a to toggle current fold (more convenient then za)
  nnoremap <Leader>a za

  " vim-easymotion
  " _w - words; _f - char
  " _t - search
  "let g:EasyMotion_leader_key = '<Space>'
  let g:EasyMotion_leader_key = '<Leader><Leader>'

  " vim-indent-guides - standard mapping
  " <Leader>ig

  " Search and replace word under cursor
  "nnoremap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

  " http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
  " remove trailing spaces
  nnoremap _$ :call preserve("%s/\\s\\+$//e")<cr>
  " autoformat file
  nnoremap _= :call preserve("normal gg=g")<cr>

  " Insert current file's folder
  cnoremap <Leader><Leader>fn <C-r>=expand('%')<CR>
  cnoremap <Leader><Leader>f <C-r>=expand('%:p:h')<CR>

  " Save as here
  ""All on one line
  "command! -nargs=1 SaveAsHere exe "saveas " . expand("%:p:h") . "/" .  expand("<args>")
  "instead use :saveas CTRL-R %

  " will expand %% to current file path
  "cabbr <expr> %% expand('%:p:h')
  cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

  " Visual search
  " select text and hit * / # to find it
  " http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
  function! s:VSetSearch()
      let temp = @@
      norm! gvy
      let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
      let @@ = temp
  endfunction

  vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
  vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

  " Put ending { to the next line
  function! ClosingBracketToNextLine()
    normal g$F{i
  endfunction
  nmap <leader>bn :call ClosingBracketToNextLine()<CR>

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

  nnoremap gl :call ToggleRelativeAbsoluteNumber()<CR>

  function! ToggleRelativeAbsoluteNumber()
    if &relativenumber
      set norelativenumber
    else
      set relativenumber
    endif
  endfunction

  " inside next (
  " note: C-U removes the '<,'> when mapping is used in visual mode
  onoremap in( :<c-u>normal! f(vi(<cr>
  " inside last (
  onoremap il( :<c-u>normal! F)vi(<cr>
  " around next (
  onoremap an( :<c-u>normal! f(va(<cr>
  " around last (
  onoremap al( :<c-u>normal! F)va(<cr>
" }}}

" Windows navigation {{{

  " C-W h|j|k|l - move to left|down|up|right win
  " C-W w       - cycle
  " C-W s|v     - split current win horiz | vert
  " :on[ly]     - leave only current win
  " C-W +|-     - height +|- 1 px
  " C-W _||     - maximize height|width
  " moving windows:
  " C-W H|J|K|L - move win to the left|down|up|right
  " C-W r       - rotate
  " C-W x       - exchange with neighbour
  " C-W T       - move window to separate tab

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

  " move to and open if not exists
  map <c-j> :call WinMove('j')<CR>
  map <c-k> :call WinMove('k')<CR>
  map <c-l> :call WinMove('l')<CR>
  map <c-h> :call WinMove('h')<CR>

  "close
  map <leader>wc :wincmd q<cr>
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

" }}}

" Debugger {{{
  "http://jaredforsyth.com/projects/vim-debug/
  function! Debug(url)
    let url = a:url
    let http_pos = stridx(url, 'http')
    if http_pos != 0
      let url = 'http://'.url
    endif
    let q_pos = stridx(url, '?')
    if q_pos == -1
      let url = url.'?XDEBUG_SESSION_START=vim_debug'
    else
      let url = url.'&XDEBUG_SESSION_START=vim_debug'
    endif
    exec "!xdg-open '".url."'"
    python debugger.run()
  endfunction
  " example:
  "   :Debug localsite.com
  command! -nargs=1 Debug call Debug('<args>')

  function! DebugPy(...)
    let str_args = join(a:000, ' ')
    let last_cmd = '!python -S ~/pydbgp/bin/pydbgp -d localhost:9000 -k vim_debug ' . str_args
    execute 'silent !echo "' . str_args . '" > ~/vim.last.arg.txt &'
    execute 'silent !echo "' . last_cmd . '" > ~/vim.last.cmd.txt &'
    execute 'silent ' . last_cmd . ' > ~/vim.last.out.txt 2> ~/vim.last.err.txt &'
      python debugger.run()
    endfunction
    " python debugging requires pydbgp
    " download from http://code.activestate.com/komodo/remotedebugging/ (version 7.1.3 works)
    " example (open test file first):
    "   :DebugPy -c tests/acceptance/selenuim/dev.cfg
    command! -nargs=* -complete=file DebugPy call DebugPy('% <args>')

    function! DebugPhpunit(...)
      let str_args = join(a:000, ' ')
      let last_cmd = '!export XDEBUG_CONFIG="idekey=vim_debug" && sleep 2 && phpunit ' . str_args
      execute 'silent !echo "' . str_args . '" > ~/vim.last.arg.txt &'
      execute 'silent !echo "' . last_cmd . '" > ~/vim.last.cmd.txt &'
      execute 'silent ' . last_cmd . ' > ~/vim.last.out.txt 2> ~/vim.last.err.txt &'
      python debugger.run()
    endfunction
    " example (open test file first):
    "   :DebugPhpunit --bootstrap tests/unitTests/bootstrap.php
    command! -nargs=* -complete=file DebugPhpunit call DebugPhpunit('<args> %')

    function! DebugPhpScript(...)
      let str_args = join(a:000, ' ')
      let last_cmd = '!export XDEBUG_CONFIG="idekey=vim_debug" && sleep 2 && php ' . str_args
      execute 'silent !echo "' . str_args . '" > ~/vim.last.arg.txt &'
      execute 'silent !echo "' . last_cmd . '" > ~/vim.last.cmd.txt &'
      execute 'silent ' . last_cmd . ' > ~/vim.last.out.txt 2> ~/vim.last.err.txt &'
      python debugger.run()
    endfunction
    " example (open test file first):
    "   :DebugPhpScript %
    command! -nargs=* -complete=file DebugPhpScript call DebugPhpScript('<args>')

    function! DebugPhpConsole(...)
      let str_args = join(a:000, ' ')
      let last_cmd = '!export XDEBUG_CONFIG="idekey=vim_debug" && sleep 2 && console/yiic ' . str_args
      execute 'silent !echo "' . str_args . '" > ~/vim.last.arg.txt &'
      execute 'silent !echo "' . last_cmd . '" > ~/vim.last.cmd.txt &'
      execute 'silent ' . last_cmd . ' > ~/vim.last.out.txt 2> ~/vim.last.err.txt &'
      python debugger.run()
    endfunction
    " example
    "   :DebugPhpConsole appadd appto.tests@gmail.com "{\"platform\": {\"app\": ...}}"
    command! -nargs=* DebugPhpConsole call DebugPhpConsole('<args>')

    let g:vdebug_options= {
    \    "timeout" : 200,
    \    "break_on_open" : 1,
    \    "ide_key" : 'vim_debug',
    \    "continuous_mode" : 1,
    \}
    let g:vdebug_keymap = {
    \    "run" : "<F5>",
    \    "run_to_cursor" : "<F9>",
    \    "step_over" : "<F10>",
    \    "step_into" : "<F11>",
    \    "step_out" : "<F12>",
    \    "close" : "<F6>",
    \    "detach" : "<F7>",
    \    "set_breakpoint" : "<F8>",
    \    "get_context" : "<F3>",
    \    "eval_under_cursor" : "<F4>",
    \}

" }}}

" Taggatron {{{
  let g:tagcommands = {
  \    "python" : {
  \        "tagfile": ".python.tags",
  \         "args": "-R",
  \         "filesappend": "/**"
  \    },
  \    "php" : {
  \        "tagfile":".php.tags",
  \        "args":"-R",
  \        "filesappend": "/**"
  \    },
  \    "javascript" : {
  \        "tagfile":".js.tags",
  \        "args":"-R",
  \        "filesappend": "/**"
  \    }
  \}
  let g:taggatron_verbose=0
  autocmd MyAutoCmd FileType php call taggatron#SetTags(".php.tags")
  autocmd MyAutoCmd FileType python call taggatron#SetTags(".python.tags")
  autocmd MyAutoCmd FileType javascript call taggatron#SetTags(".js.tags")

  " todo: check http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
  "       and https://github.com/tpope/vim-fugitive/issues/104

" }}}

" Save and launch vim {{{
  " default: blank,buffers,curdir,folds,help,options,tabpages,winsize"
  set sessionoptions=buffers,curdir,help,winsize " localoptions,
  " default: '100,<50,s10,h
  " NOTE: ! is necessary in order to be able to restore last session
  set viminfo=!,'100,/50,:50,<50,@50,h,s10

  map <Leader>s :SessionList<CR>

  autocmd MyAutoCmd VimEnter *  call LoadLocalVimrc()

  function! LoadLocalVimrc()
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
      :Rooter
  endfunction

  function! QuitNetrw()
    for i in range(1, bufnr($))
      if buflisted(i)
        if getbufvar(i, '&filetype') != "netrw"
          silent exe 'bwipeout ' . i
        endif
      endif
    endfor
  endfunction

  autocmd MyAutoCmd VimLeavePre *  call QuitNetrw()

" }}}

" Utils {{{

  " Diff current unsaved file
  function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
  endfunction

  " Find and replace in multiple files
  command! -nargs=* -complete=file Fart call FindAndReplace(<f-args>)
  function! FindAndReplace(...)
    if a:0 < 3
      echohl Error | echo "Three arguments required: 1. file pattern, 2. search expression and 3. replacement" | echohl None
      return
    endif
    if a:0 > 3
      echohl Error | echo "Too many arguments, three required: 1. file pattern, 2. search expression and 3. replacement" | echohl None
      return
    endif
    let l:pattern = a:1
    let l:search = a:2
    let l:replace = a:3
    echo "Replacing occurences of '".l:search."' with '".l:replace."' in files matching '".l:pattern."'"

    execute '!find . -name "'.l:pattern.'" -print | xargs -t sed -i "s/'.l:search.'/'.l:replace.'/g"'
  endfunction

    " Text encoding menu (koi8-r, cp1251, cp866, utf8)
    set wcm=<Tab>
    menu Encoding.koi8-r :e ++enc=koi8-r<CR>
    menu Encoding.windows-1251 :e ++enc=cp1251<CR>
    menu Encoding.cp866 :e ++enc=cp866<CR>
    menu Encoding.utf-8 :e ++enc=utf8 <CR>

    let b:encindex=0
    function! RotateEnc()
      let y = -1
      while y == -1
        let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
        let x = match(encstring,"#",b:encindex)
        let y = match(encstring,"#",x+1)
        let b:encindex = x+1
        if y == -1
          let b:encindex = 0
        else
          let str = strpart(encstring,x+1,y-x-1)
          return ":e ++enc=".str
        endif
      endwhile
    endfunction

    let b:encindex=0
    function! ForceRotateEnc()
      let y = -1
      while y == -1
        let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
        let x = match(encstring,"#",b:encindex)
        let y = match(encstring,"#",x+1)
        let b:encindex = x+1
        if y == -1
          let b:encindex = 0
        else
          let str = strpart(encstring,x+1,y-x-1)
          :execute "set encoding=".str
          return ":e ++enc=".str
        endif
      endwhile
    endfunction

    let b:fencindex=0
    function! RotateFEnc()
      let y = -1
      while y == -1
        let encstring = "#koi8-r#cp1251#8bit-cp866#utf-8#ucs-2le#"
        let x = match(encstring,"#",b:fencindex)
        let y = match(encstring,"#",x+1)
        let b:fencindex = x+1
        if y == -1
          let b:fencindex = 0
        else
          let str = strpart(encstring,x+1,y-x-1)
          return ":set fenc=".str
        endif
      endwhile
    endfunction

" }}}

" " Unite  {{{

" "https://github.com/terryma/dotfiles/blob/master/.vimrc
" "http://vpaste.net/l1WqE
" "https://github.com/thinca/vim-ref
" "http://d.hatena.ne.jp/osyo-manga/20130307/1362621589
" "https://github.com/naruyan/nar/blob/master/.vimrc
" "
" " Map space-f as a prefix for Unite
" nnoremap [unite] <Nop>
" nmap <space>f [unite]
" " Ctrl-ss: (S)earch word under cur(s)or in current directory
" nnoremap <c-s><c-s> :Unite grep:.::<C-r><C-w><CR>
" " Ctrl-sr: Easier (s)earch and (r)eplace
" nnoremap <c-s><c-r> :%s/<c-r><c-w>//gc<left><left><left>
" " Ctrl-r: Easier search and replace
" "vnoremap <c-r> "hy:%s/<c-r>h//gc<left><left><left>
" " Ctrl-s: Easier substitue
" "vnoremap <c-s> :s/\%V//g<left><left><left>

" """ Search for files
" " General fuzzy search - async recursive directory search + new files
" nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files -no-split file_rec/async file/new<CR>
" " Find files with find
" nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find -no-split find:.<CR>
" " Quick buffer and mru
" nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=buffers -no-split buffer file_mru<CR>
" nnoremap <silent> [unite]mm :<C-u>Unite -buffer-name=buffers -quick-match -no-split buffer file_mru<CR>

" """ Search in files
" " git grep
" nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep -no-quit vcs_grep/git:.<CR>
" " grep
" nnoremap <silent> [unite]gg :<C-u>Unite -buffer-name=grep -no-quit grep:.<CR>
" " grep (specify directory)
" nnoremap <silent> [unite]gd :<C-u>Unite -buffer-name=grep -no-quit grep<CR>
" " grep (current file directory)
" nnoremap <silent> [unite]gf :<C-u>Unite -buffer-name=grep -no-quit grep:<C-r>=expand('%:p:h')<CR><CR>

" " Note: searches with :Ggrep are fast and populate quickfix, so it is
" " convenient to go over results without switching back to unite buffer
" " :cnext / :cprev or unimpaired's mapplings ]q / [q
" " Examples:
" "   Ggrep 'text' | copen - find text and open quick fix buffer
" "   Ggrep -i 'someothertext' - ignore case
" "   Ggrep 'text' -- '*.php' | copen - search only php files
" "   Ggrep 'text' -- '*.[ch]' | copen - search only *.c and *.h files

" function! Unext(motion)
"     let l:uwin = bufwinnr("*unite* - grep")
"     echo l:uwin
"     if l:uwin != -1
"         exec "norm! ".l:uwin."\<c-w>\<c-w>"
"         exec "norm! ".a:motion
"         exec "norm \<CR>"
"         call unite#view#_redraw('','','')
"     endif
" endfun
" noremap ]g :<C-U>call Unext("j")<CR>
" noremap [g :<C-U>call Unext("k")<CR>

" " grep with preview
" "nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:. -auto-preview<CR>
" " Fuzzy search from current buffer
" " nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
"       " \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" " to search specific dir and keep results:
" " :Unite -no-quit grep:some/dir

" "" Quickly switch lcd
" "nnoremap <silent> [unite]d
"       "\ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" """ Search inside the file
" " Quick outline
" nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>
" " Quick line using the word under cursor
" nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" """ Search vim lists
" " Quick registers
" nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" " Quick yank history
" nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>
" " Quick vim commands
" nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>
" " Quick command history
" nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history history/command command<CR>
" " Quick bookmarks
" nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>
" " Quick help
" nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>
" " Quick unite sources
" nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" " Quick processes
" nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=processes process<CR>

" "" Custom Unite settings
" autocmd MyAutoCmd FileType unite call s:unite_settings()
" function! s:unite_settings()
"   nmap <buffer> <ESC> <Plug>(unite_exit)
"   imap <buffer> <ESC> <Plug>(unite_exit)
"   imap <buffer> jj <Plug>(unite_insert_leave)
"   imap <buffer> jk <Plug>(unite_insert_leave)
"   imap <buffer> kj <Plug>(unite_insert_leave)
"   "" imap <buffer> <c-j> <Plug>(unite_select_next_line)
"   "imap <buffer> <c-j> <Plug>(unite_insert_leave)
"   "nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
"   "nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
"   "imap <buffer> <c-a> <Plug>(unite_choose_action)
"   "imap <buffer> <Tab> <Plug>(unite_exit_insert)
"   "imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
"   "imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
"   "imap <buffer> '     <Plug>(unite_quick_match_default_action)
"   "nmap <buffer> '     <Plug>(unite_quick_match_default_action)
"   "nmap <buffer> <C-r> <Plug>(unite_redraw)
"   "imap <buffer> <C-r> <Plug>(unite_redraw)
"   "inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
"   "nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
"   "inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   "nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')

"   "let unite = unite#get_current_unite()
"   "if unite.buffer_name =~# '^search'
"     "nnoremap <silent><buffer><expr> r     unite#do_action('replace')
"   "else
"     "nnoremap <silent><buffer><expr> r     unite#do_action('rename')
"   "endif

"   "nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
" endfunction

" " Use the fuzzy matcher for everything
" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" " Use the rank sorter for everything - fuzzy matcher does not use sorter
" " call unite#filters#sorter_default#use(['sorter_rank'])
" " Start in insert mode
" let g:unite_enable_start_insert = 1
" " Enable history yank source
" let g:unite_source_history_yank_enable = 1
" " Open in bottom right
" let g:unite_split_rule = "botright"
" " Shorten the default update date of 500ms
" let g:unite_update_time = 200
" let g:unite_source_rec_max_cache_files = 10000

" let g:unite_source_file_mru_limit = 1000
" let g:unite_cursor_line_highlight = 'TabLineSel'
" " let g:unite_abbr_highlight = 'TabLine'

" let g:unite_source_file_mru_filename_format = ':~:.'
" let g:unite_source_file_mru_time_format = ''
" let g:unite_data_directory = expand('~/.vim/tmp/unite/')

" " For ack.
" if executable('ag')
"   " https://github.com/ggreer/the_silver_searcher
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts = '--noheading --nocolor -a'
"   let g:unite_source_grep_recursive_opt = ''
" elseif executable('ack-grep')
"   let g:unite_source_grep_command = 'ack-grep'
"   let g:unite_source_grep_default_opts = '--no-heading --no-color -a --type-set tags=.tags --notags'
"   let g:unite_source_grep_recursive_opt = ''
" elseif executable('ack')
"   let g:unite_source_grep_command = 'ack'
"   let g:unite_source_grep_default_opts = '--no-heading --no-color -a --type-set tags=.tags --notags'
"   let g:unite_source_grep_recursive_opt = ''
" endif

" " Set up some custom ignores
" call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
"       \ 'ignore_pattern', join([
"       \ '\.git/',
"       \ '\.svn/',
"       \ '\.cache/',
"       \ '.*\.tags',
"       \ '.*\.pyc',
"       \ '.*\.jpg',
"       \ ], '\|'))
" " }}}

" YouCompleteMe, Supertab and Ultisnips {{{

  " http://0x3f.org/blog/make-youcompleteme-ultisnips-compatible/
  let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
  let g:SuperTabDefaultCompletionType = '<C-Tab>'

  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

  " Ultisnips
  "let g:UltiSnipsExpandTrigger="<c-tab>"
  "let g:UltiSnipsListSnippets="<c-s-tab>"
  "let g:UltiSnipsJumpForwardTrigger="<c-tab>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-s-tab>"

" }}}

" VimShell {{{
  " let g:vimshell_prompt = "% "
" }}}

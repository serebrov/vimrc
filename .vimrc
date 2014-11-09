" Plugins {{{
  set nocompatible " explicitly get out of vi-compatible mode
  filetype off

  " setup Vundle {{{
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/vundle
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()

    Plugin 'gmarik/vundle'
  " }}}

  """""" UI
  " sensible defaults
  Plugin 'tpope/vim-sensible'
  " auto adjust tab/space settings based on current file
  Plugin 'tpope/vim-sleuth'
  " Additional features for netrw
  " - to open browser focused on current file, - again to go upper
  " . to put selected file name to the end of command line; ! to do the
  " same and start command line with !
  " ~ - go home; cd/cl - :cd / :lcd
  Plugin 'tpope/vim-vinegar'
  "Plugin 'serebrov/vim-vinegar'
  " visual guides for indents, :IndentLinesToggle
  "Plugin 'Yggdroot/indentLine'
  " automatically switches to relative numbers when go to normal mode
  "Plugin 'myusuf3/numbers.vim.git'
  " :Matchmaker to enable dynamic highlighting of the word under the
  " cursor (move the cursor and it will highlight the different word)
  " :Matchmaker! to turn it off
  Plugin 'qstrahl/vim-matchmaker'
  " At every search command, it automatically prints
  " "At match #N out of M matches".
  Plugin 'IndexedSearch'
  " rainbow parenthesis
  " Note: doesn't work for php due some specifics in the syntax file
  " it doesn't work with default syntax file and with extended versions
  " (https://github.com/vim-scripts/php.vim--Garvin) and (https://github.com/StanAngeloff/php.vim)
  " maybe this can be fixed?
  " see https://defuse.ca/blog/vim-rainbow-parentheses-work-in-php
  Plugin 'kien/rainbow_parentheses.vim'
  Plugin 'kien/ctrlp.vim'
  Plugin 'rking/ag.vim'
  " Powerline - create better-looking, more functional vim statuslines.
  "Plugin 'Lokaltog/vim-powerline'
  Plugin 'bling/vim-airline'
  " adopt color schemes for terminal
  Plugin 'godlygeek/csapprox'
  " Solarized color scheme
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'sjl/badwolf'
  Plugin 'nanotech/jellybeans.vim'
  Plugin 'noahfrederick/vim-hemisu'

  Plugin 'terryma/vim-expand-region'

  "This plugin provides the following mappings which allow
  "you to move between Vim panes and tmux splits seamlessly.
  "<ctrl-h> => Left
  "<ctrl-j> => Down
  "<ctrl-k> => Up
  "<ctrl-l> => Right
  "<ctrl-\> => Previous split
  Plugin 'christoomey/vim-tmux-navigator'
  ":Tmux lets you call any old tmux command (with really good tab complete).
  ":Tyank and :Tput give you direct access to tmux buffers.
  ":Twrite sends a chunk of text to another pane. Give an argument like windowtitle.2, top-right, or last, or let it default to the previously given argument.
  ":Tattach lets you use a specific tmux session from outside of it.
  Plugin 'tpope/vim-tbone'

  " Manage files and directories in vim
  " :Vimdir [directory] - To list files and folders
  " :VimdirR [directory] - To list files and folders recursive
  Plugin 'c0r73x/vimdir.vim'

  "ensure dir exists before save the file
  "so :e some_new_dir/some_new_file and then :w will work
  Plugin 'dockyard/vim-easydir'

  """""" Git
  " git support: Gedit, Gdiff, Gstatus, Gcommit, Gblame, Gmove, Gremove
  " Ggrep, Glog, Gread, Gwrite, Gbrowse
  " Search in a specific directory:
  " :Ggrep searchterm -- foldername | copen
  " Search specific file types:
  " :Ggrep searchterm -- '*.ext' | copen
  Plugin 'tpope/vim-fugitive'
  Plugin 'gregsexton/gitv'
  " fugitive extension, commit browser - :Extradite
  Plugin 'int3/vim-extradite'
  " see http://sjl.bitbucket.org/splice.vim/
  Plugin 'sjl/splice.vim'
  "Shows +/- for git changes
  "off :GitGutterDisable, on :GitGutterEnable, toggle :GitGutterToggle
  "Jump between diffs: ]c/[c
  Plugin 'airblade/vim-gitgutter'

  Plugin 'TyeMcQueen/vim-merge-windows'
  let s:diff_algo = "patience"
  function! PDiff()
      let opt = ""
      if &diffopt =~ "icase"
          let opt = opt . "-i "
      endif
      if &diffopt =~ "iwhite"
          let opt = opt . "-b -B "
      endif
      " pdiff script has --patience option, but our options come at the end,
      " so we will overwrite the algorithm
      " supported are:
      "  default, myers
      "      The basic greedy diff algorithm. Currently, this is the default.
      "  minimal
      "      Spend extra time to make sure the smallest possible diff is produced.
      "  patience
      "      Use ""patience diff"" algorithm when generating patches.
      "  histogram
      "      This algorithm extends the patience algorithm to
      "      support low-occurrence common elements
      let opt = opt . "--diff-algorithm=" . s:diff_algo . " "
      silent execute "!pdiff -a " . opt . v:fname_in . " " .
          \ v:fname_new . " > " . v:fname_out
  endfunction
  function! PDiffOn(algorithm)
    let s:diff_algo = a:algorithm
    set diffexpr=PDiff()
    "source ~/.vim/bundle/vim-merge-windows/patience-diff.vim
    "source ~/.vim/bundle/vim-merge-windows/vim-merge-windows.vim
    diffupdate
  endfunction
  function! PDiffOff()
    set diffexpr=
    diffupdate
  endfunction
  command! PDiffOnMyers call PDiffOn('myers')
  command! PDiffOnPatience call PDiffOn('patience')
  command! PDiffOnMinimal call PDiffOn('minimal')
  command! PDiffOnHistogram call PDiffOn('histogram')
  command! PDiffOff call PDiffOff()

  set diffopt=filler,iwhite

  """""" Motions / normal mode commands
  " Simpler way to use some motions in vim.
  " Start motion with <Leader><Leader>
  " Like <Space>w to trigger the word motion w
  " Other triggers: f/t/F/T (find char), w/W/b/B/e/E/ge/gE (word motions), j/k (lines), n/N (searches)
  " Tutorial: http://net.tutsplus.com/tutorials/other/vim-essential-plugin-easymotion/
  " It is similar to vimperator (FireFox extenstion) link select mode
  Plugin 'Lokaltog/vim-easymotion'
  " CamelCase and under_score motions: ,w ,b ,e and i,w i,b i,e
  Plugin 'bkad/CamelCaseMotion'
  " av: around variable
  " iv: inner variable
  Plugin 'robmiller/vim-movar'
  " Change surrounding objects
  " cs<from><to> - change surrounding
  " cs"' - change " surround " to '
  " cs'<q> - change surround ' to <q>..</q>
  " cst" - chage surrounding tag to "
  " ds<what> - remove surrounding
  " ds" - remove surrounding
  " ys<motion><what> - add surrounding
  " ysiw] - add surrounding [] for inner word
  " yssb or yss) - surround a line with ()
  " in visual mode S<what> will surround selected text
  Plugin 'tpope/vim-surround'
  " Required by vim-surround
  Plugin 'tpope/vim-repeat'
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
  " [e - move line up ]e - move line down
  "
  " [f / ]f - previous / next file in directory
  " [n / ]b - previous / next conflict marker
  Plugin 'tpope/vim-unimpaired'
  " Commenting code
  " <Leader>cc - comment line or selected text
  " <Leader>cu - uncomment line or selected text
  " <Leader>cm - comment with multiline /* */ comments
  " <Leader>cs - 'sexy' comments
  " <Leader>c<space> - toggle comments state, see more in help
  "Plugin 'scrooloose/nerdcommenter'

  " gcc - comment out line
  " gc<motion> - comment out lines defined by motion
  Plugin 'tpope/vim-commentary'

  """""" Commands
  "Vim sugar for the UNIX shell commands that need it the most. Commands
  "include:
  " :Unlink: Delete a buffer and the file on disk simultaneously.
  " :Remove: Like :Unlink, but doesn't require a neckbeard.
  " :Move: Rename a buffer and the file on disk simultaneously.
  " :Chmod: Change the permissions of the current file.
  " :Find: Run find and load the results into the quickfix list.
  " :Locate: Run locate and load the results into the quickfix list.
  " :SudoWrite: Write a privileged file with sudo.
  " :W: Write every open window. Handy for kicking off tools like guard.
  Plugin 'tpope/vim-eunuch'
  " Add abbreviations for all combinations
  " :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
  " Replace combinations + smart case (Facility -> Building, facilities -> buildings)
  " :%Subvert/facilit{y,ies}/building{,s}/g
  " Coercion: crs - coerce to snake case, crm - mixed case, crc - camel, cru - upper fooBar (crs)-> foo_bar
  Plugin 'tpope/vim-abolish'
  " :Tabularize /, - tablarize by ','
  " :Tabularize /,/[r|l|c]0
  " r - align right, l - left, c - center
  " 0 (or other number) - number of spaces between fields
  " :Tabularize /,/r1c1l0
  " formatters will be applied in the specified order
  " :Tabularize /^[^,]*\zs,/r0c0l0 - use regex ^[^,]*\zs, (match only first comma)
  " :AddTabularPattern first_comma /^[^,]*\zs,/r0c0l0 - save pattern
  " (:Tab first_comma)
  " Standard extensions (after/plugin/TabularMaps.vim)
  "  assignment, two_spaces, multiple_spaces, argument_list,
  "  split_declarations, trenary_operator, cpp_io, pascal_assign,
  "  trailing_c_comments
  Plugin 'godlygeek/tabular'
  " Gundo.vim is Vim plugin to visualize your Vim undo tree.
  Plugin 'sjl/gundo.vim'
  " adds a Plugins menu to Vim, displaying the installed plugins and the features they provide
  Plugin 'Headlights'
  " :Multichange to enter multichange mode (cw will affect the whole file)
  Plugin 'AndrewRadev/multichange.vim'
  " disable mapping entirely
  let g:multichange_mapping = ''
  " gS / gJ to split / join multiline / single lines forms of code
  Plugin 'AndrewRadev/splitjoin.vim'
  " always highlight matching html tags
  Plugin 'Valloric/MatchTagAlways'

  """""" Programming / tags / autocomplete
  " Syntax checker
  Plugin 'scrooloose/syntastic'
  " fetching can take a long time causing the timeout
  " to manually install it
  "  git clone --recursive https://github.com/Valloric/YouCompleteMe.git
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'UltiSnips'
  Plugin 'honza/vim-snippets'
  "Plugin 'ervandew/supertab'
  Plugin 'joonty/vdebug'
  Plugin 'joonty/vim-taggatron'
  Plugin 'airblade/vim-rooter'
  " https://github.com/majutsushi/tagbar/wiki
  " http://majutsushi.github.com/tagbar/ :TagbarToggle
  Plugin 'majutsushi/tagbar'
  " autoinsert pair symbols (such as brackets)
  " disable because it breaks dot(.) - it repeats only what was entered
  " inside the paired symbols, not the whole text
  " https://github.com/kana/vim-smartinput/issues/33
  "Plugin 'kana/vim-smartinput'

  """""" Db
  " see https://mutelight.org/dbext-the-last-sql-client-youll-ever-need
  Plugin 'vim-scripts/dbext.vim'

  """""" Markdown
  Plugin 'tpope/vim-markdown'
  " Markup files preview: <Leader>P
  Plugin 'greyblake/vim-preview'
  Plugin 'suan/vim-instant-markdown'

  """""" PHP
  " php completion - it should be copied to autoload/phpcomplete.vim
  Plugin 'shawncplus/phpcomplete.vim'
  " php 5.3 syntax
  Plugin 'StanAngeloff/php.vim'
  Plugin '2072/PHP-Indenting-for-VIm'
  " view php docs with K
  " Plugin 'mudpile45/vim-phpdoc'
  " Plugin 'mikehaertl/yii-api-vim'
  " php documenter
  Plugin 'mikehaertl/pdv-standalone'

  """""" Javascript
  "Plugin 'jelera/vim-javascript-syntax'
  "Plugin 'itspriddle/vim-jquery.git'
  Plugin 'pangloss/vim-javascript'
  let g:javascript_conceal = 0
  Plugin 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs = 'jquery,underscore,angularjs'
  " ejs templates syntax highlight
  Plugin 'briancollins/vim-jst.git'
  Plugin 'heavenshell/vim-jsdoc'

  """""" Go
  Plugin 'fatih/vim-go'

  """""" Wakatime: https://wakatime.com
  Plugin 'wakatime/vim-wakatime'

  set runtimepath+=~/.vim/bundle/potion
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
              echo "Solarized theme not found. Run :PluginInstall"
          endtry
      " }}}
      if &diff
        set background=light
        set guifont=Liberation\ Mono\ 9
        colorscheme github
        " A bit modified diff colors from github scheme
        hi DiffAdd         guifg=#003300 guibg=#DDFFDD gui=none
        hi DiffChange                    guibg=#ececec gui=none
        hi DiffText        guifg=#000033 guibg=#A6F3A6 gui=none
        hi DiffDelete      guifg=#DDCCCC guibg=#FFDDDD gui=none
        " highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
        " highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
        " highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
        " highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
      endif
      " From: http://sunaku.github.io/vim-256color-bce.html
      if &term =~ '256color'
          " Fix for tmux
          " disable Background Color Erase (BCE) so that color schemes
          " render properly when inside 256-color tmux and GNU screen.
          " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
          set t_ut=
      endif
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

" Auto-read and auto-write {{{
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
    autocmd InsertLeave,CursorHold,CursorHoldI * call DoAutosave()
    autocmd FocusLost,WinLeave   * call DoAutosave()
  augroup END
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
  set wildmode=longest,list
  "set wildmode=longest:full,full
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

  "For gitgutter, to make the sign column to be the same as line numbers
  "column
  highlight clear SignColumn

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
  " augroup fold_vim
  "   autocmd!
  "   autocmd FileType vim setlocal foldmethod=marker
  " augroup END

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

  " let g:airline_section_y       (fileencoding, fileformat)
  " let g:airline_section_y = vdebug:statusline()

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

  " http://stackoverflow.com/questions/18285751/use-ag-in-ctrlp-vim
  if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif
  let g:ctrlp_switch_buffer = 'vt'

" }}}

" Mappings {{{
  "let mapleader = ","
  "let mapleader = "\<space>"
  " Better then let mapleader because vim command line will still
  " display leader-based mappings as \s
  " From http://www.reddit.com/r/vim/comments/1vdrxg/space_is_a_big_key_what_do_you_map_it_to/
  map <space> <leader>

  " Swap ; and :, use ;; as ;
  "nnoremap ; :
  "nnoremap ;; ;

  " * and # will stay on the first match
  " nnoremap * *<C-O>
  nnoremap * *N
  nnoremap # #N

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
  "nnoremap <leader>vc :tabedit $MYVIMRC<CR>
  nnoremap <leader>vc :tabedit $HOME/.vim/.vimrc<CR>

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

  "  http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
  "  Hit v to select one character
  "  Hit vagain to expand selection to word
  "  Hit v again to expand to paragraph
  "  ...
  "  Hit <C-v> go back to previous selection if I went too far
  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)

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

  " C-W h|j|k|l   - move to left|down|up|right win
  " v C-W h|j|k|l - split to left|down|up|right win
  " C-W w         - cycle
  " C-W s|v       - split current win horiz | vert
  " :on[ly]       - leave only current win
  " C-W +|-       - height +|- 1 px
  " C-W _||       - maximize height|width
  " moving windows:
  " C-W H|J|K|L   - move win to the left|down|up|right
  " C-W r         - rotate
  " C-W x         - exchange with neighbour
  " C-W T         - move window to separate tab

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
  vmap <c-j> :call WinMove('j')<CR>
  vmap <c-k> :call WinMove('k')<CR>
  vmap <c-l> :call WinMove('l')<CR>
  vmap <c-h> :call WinMove('h')<CR>

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

  noremap <Leader>f :CtrlPMRUFiles<CR>

  " format json, see https://coderwall.com/p/faceag
  " :%!python -m json.tool
  " or with jq http://stedolan.github.io/jq/
  "   download, mv to ~/bin/jq, chmod +x ~/bin/jq
  " :%!jq '.'

" }}}

" Debugger {{{
  "http://jaredforsyth.com/projects/vim-debug/
  function! DebugWeb(url)
    let g:vdebug_options['break_on_open'] = 1
    let g:vdebug_options['continuous_mode'] = 1
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
  command! -nargs=1 DebugWeb call DebugWeb('<args>')

  function! DebugPy(...)
    let g:vdebug_options['break_on_open'] = 1
    let g:vdebug_options['continuous_mode'] = 0
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

  function! DebugPhp(command, ...)
    let g:vdebug_options['break_on_open'] = 1
    let g:vdebug_options['continuous_mode'] = 0
    let str_args = join(a:000, ' ')
    let last_cmd = '!export XDEBUG_CONFIG="idekey=vim_debug" && sleep 2 && ' . a:command . ' ' . str_args
    execute 'silent !echo "' . str_args . '" > ~/vim.last.arg.txt &'
    execute 'silent !echo "' . last_cmd . '" > ~/vim.last.cmd.txt &'
    execute 'silent ' . last_cmd . ' > ~/vim.last.out.txt 2> ~/vim.last.err.txt &'
    python debugger.run()
  endfunction

  " function! DebugPhpTemp(command, ...)
  "   let g:vdebug_options['break_on_open'] = 1
  "   let g:vdebug_options['continuous_mode'] = 0
  "   let str_args = join(a:000, ' ')
  "   let last_cmd = '!export XDEBUG_CONFIG="idekey=vim_debug_temp" && sleep 2 && ' . a:command . ' ' . str_args
  "   execute 'silent !echo "' . str_args . '" > ~/vim.last.arg.txt &'
  "   execute 'silent !echo "' . last_cmd . '" > ~/vim.last.cmd.txt &'
  "   execute 'silent ' . last_cmd . ' > ~/vim.last.out.txt 2> ~/vim.last.err.txt &'
  "   python debugger.run()
  " endfunction

  " example (runtests.sh invokes phpunit):
  "   :DebugPhp wordpress-tests/runtests.sh --filter test_export_book_new --bootstrap wordpress-tests/bootstrap.php %
  command! -nargs=* -complete=file DebugPhp call DebugPhp('<args>')
  "command! -nargs=* -complete=file DebugPhpTemp call DebugPhpTemp('<args>')
  " example (open test file first):
  "   :DebugPhpunit --bootstrap tests/unitTests/bootstrap.php
  command! -nargs=* -complete=file DebugPhpunit call DebugPhp('phpunit', '<args> %')
  " example (open test file first):
  "   :DebugPhpScript %
  command! -nargs=* -complete=file DebugPhpScript call DebugPhp('php', '<args>')
  " example
  "   :DebugPhpConsole appadd appto.tests@gmail.com "{\"platform\": {\"app\": ...}}"
  command! -nargs=* DebugYiiConsole call DebugPhp('console/yiic', '<args>')

  let g:vdebug_options = {
  \    "timeout" : 200,
  \    "break_on_open" : 0,
  \    "ide_key" : 'vim_debug',
  \    "continuous_mode" : 1,
  \    "auto_start" : 1,
  \}
  let g:vdebug_keymap = {
  \    "run" : "<F5>",
  \    "run_to_cursor" : "<F9>",
  \    "step_over" : "<F8>",
  \    "step_into" : "<F7>",
  \    "step_out" : "<F4>",
  \    "close" : "<F6>",
  \    "detach" : "<F11>",
  \    "set_breakpoint" : "<F12>",
  \    "get_context" : "<F10>",
  \    "eval_under_cursor" : "<F3>",
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

  noremap <Leader>s :SessionList<CR>

  let g:debug_tabsession = 0
  let g:debug_tabsession_file = '~/vim.tabsession.log'
  let g:tabsession_load_after = 'LoadLocalVimrc()'

  function! TestEcho(test)
    echom 'Test: ' . a:test
  endfunction

  function! LoadLocalVimrc()
    :Rooter
    "echom 'Loading local in: ' . getcwd()
    " Check for .vimrc.local in the current directory
    let custom_config_file = getcwd() . '/.vimrc.local'
    if filereadable(custom_config_file)
      exe 'source' custom_config_file
      "echom 'Loaded local vimrc: ' . custom_config_file
    else
      let custom_config_file = getcwd() . '/.git/.vimrc.local'
      if filereadable(custom_config_file)
        exe 'source' custom_config_file
        "echom 'Loaded local vimrc: ' . custom_config_file
      endif
    endif
    "execute ':windo filtype detect'
  endfunction

  autocmd MyAutoCmd BufWinEnter *  call LoadLocalVimrc()
  " autocmd MyAutoCmd BufWinEnter *  call TestEcho('BufWinEnter')
  " autocmd MyAutoCmd VimEnter *  call TestEcho('TabEnter')
  " autocmd MyAutoCmd VimEnter *  call TestEcho('VimEnter')

  function! QuitNetrw()
    for i in range(1, bufnr("$"))
      if buflisted(i)
        if getbufvar(i, '&filetype') == "netrw"
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

" YouCompleteMe, Supertab and Ultisnips {{{

  " http://0x3f.org/blog/make-youcompleteme-ultisnips-compatible/
  " let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
  " let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
  " let g:SuperTabDefaultCompletionType = '<C-Tab>'
  let g:ycm_key_list_select_completion = []
  let g:ycm_key_list_previous_completion = []

  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

  " Ultisnips
  "let g:UltiSnipsExpandTrigger="<c-tab>"
  "let g:UltiSnipsListSnippets="<c-s-tab>"
  "let g:UltiSnipsJumpForwardTrigger="<c-tab>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-s-tab>"

" }}}

" Xiki {{{
  function! XikiLaunch()
    ruby << EOF

      #xiki_dir = ENV['XIKI_DIR']
      xiki_dir = '/home/seb/xiki'
      ['core/ol', 'vim/line', 'vim/tree'].each {|o| load "#{xiki_dir}/lib/xiki/#{o}.rb"}
      include Xiki

      line = Line.value
      next_line = Line.value 2

      indent = line[/^ +/]
      command = "xiki '#{line}'"
      result = `#{command}`
      Tree << result
EOF
  endfunction

  " imap <silent> <2-LeftMouse> <C-c>:call XikiLaunch()<CR>i
  " nmap <silent> <2-LeftMouse> :call XikiLaunch()<CR>
  imap <silent> <C-CR> <C-c>:call XikiLaunch()<CR>i
  nmap <silent> <C-CR> :call XikiLaunch()<CR>
  imap <silent> <C-@> <C-c>:call XikiLaunch()<CR>i
  nmap <silent> <C-@> :call XikiLaunch()<CR>

" }}}

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    filetype off

    " vundle {
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        " let Vundle manage Vundle
        Bundle 'gmarik/vundle'
    " }
    " https://github.com/mutewinter/dot_vim
    " My Bundles here {
        " original repos on github
        " ========================
        " git support: Gedit, Gdiff, Gstatus, Gcommit, Gblame, Gmove, Gremove
        " Ggrep, Glog, Gread, Gwrite, Gbrowse
        Bundle 'tpope/vim-fugitive'
        " fugitive extension, commit browser - :Extradite
        Bundle 'int3/vim-extradite'
        " visual guides for indents, default mapping <Leager>ig
        Bundle 'nathanaelkane/vim-indent-guides'
        " Powerline - create better-looking, more functional vim statuslines.
        Bundle 'Lokaltog/vim-powerline'
        " Simpler way to use some motions in vim.
        " Start motion with <Leader><Leader> to trigger easy motion mode.
        " Like <Leader><Leader>w to trigger the word motion w
        " Other triggers: f/t/F/T (find char), w/W/b/B/e/E/ge/gE (word motions), j/k (lines), n/N (searches)
        " Use let g:EasyMotion_leader_key = '<Leader>' to set single leader to
        " enable easy motion
        " Tutorial: http://net.tutsplus.com/tutorials/other/vim-essential-plugin-easymotion/
        " It is similar to vimperator (FireFox extenstion) link select mode
        Bundle 'Lokaltog/vim-easymotion'
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
        Bundle 'tpope/vim-surround'
        " Required by vim-surround
        Bundle 'tpope/vim-repeat'
        " Pair commands, some of them:
        " [q |:cprevious|
        " ]q |:cnext|
        " [o - previous file in directory
        " ]o - next file in directory
        " [Space - add [count] blank lines before cursor
        " ]Space - add [count] blank lines after cursor
        " [e - move line up
        " ]e - move line down
        " [x - XML encode
        " ]x - XML decode
        " [u - URL encode
        " ]u - URL decode
        Bundle 'tpope/vim-unimpaired'
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
        Bundle 'godlygeek/tabular'
        "This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
        " Bundle 'Raimondi/delimitMate'
        " This plugin highlights the matching HTML tag when the cursor is
        Bundle 'gregsexton/MatchTag'
        "Just a NERDTree
        Bundle 'scrooloose/nerdtree'
        "Ack search support for NERDTree
        " depends on ack - http://betterthangrep.com
        " sudo apt-get install ack-grep
        Bundle 'tyok/nerdtree-ack'
        " Commenting code
        " <Leader>cc - comment line or selected text
        " <Leader>cu - uncomment line or selected text
        " <Leader>cm - comment with multiline /* */ comments
        " <Leader>cs - 'sexy' comments
        " <Leader>c<space> - toggle comments state, see more in help
        Bundle 'scrooloose/nerdcommenter'
        " Syntax checker
        Bundle 'scrooloose/syntastic'
        " Supertab is a plugin which allows you to perform all your insert completion
        " (|ins-completion|) using the tab key.
        " Bundle 'ervandew/supertab'
        " Solarized color scheme
        Bundle 'altercation/vim-colors-solarized'
        "Ack support for vim
        Bundle 'mileszs/ack.vim'
        " Markdown support
        Bundle 'hallison/vim-markdown'
        " Markup files preview
        " <Leader>P
        Bundle 'greyblake/vim-preview'
        "
        " vim-scripts repos
        " =================
        "Bundle 'UltiSnips'
        " At every search command, it automatically prints
        " "At match #N out of M matches".
        Bundle 'IndexedSearch'
        " CtrlP
        Bundle 'kien/ctrlp.vim'
        "
        " PHP
        " ====
        " it should be copied to autoload/phpcomplete.vim
        Bundle 'shawncplus/phpcomplete.vim'
        Bundle 'vim-scripts/php.vim--Garvin'
        Bundle '2072/PHP-Indenting-for-VIm'
        Bundle 'mudpile45/vim-phpdoc'
        Bundle 'mikehaertl/yii-api-vim'
        Bundle 'mikehaertl/pdv-standalone'
        " This allows you to select some text using Vim's visual mode and then hit *
        " and # to search for it elsewhere in the file.
        Bundle 'gmarik/vim-visual-star-search'
        "Bundle "jQuery"
        "Bundle "tComment"
        "nnoremap // :TComment<CR>
        "vnoremap // :TComment<CR>
        " ...
        "
        " Brief help
        " :BundleList          - list configured bundles
        " :BundleInstall(!)    - install(update) bundles
        " :BundleSearch(!) foo - search(or refresh cache first) for foo
        " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
        "
        " CamelCase and under_score motions
        " https://github.com/bkad/CamelCaseMotion
        " Gundo.vim is Vim plugin to visualize your Vim undo tree.
        Bundle 'sjl/gundo.vim'
        " Defines 'indentation' text object
        " https://github.com/michaeljsmith/vim-indent-object
        "
        "" Interface
        Bundle 'git://github.com/xolox/vim-easytags.git'
        Bundle 'git://github.com/vim-scripts/taglist.vim.git'
        " - doesn't work with vundle install Bundle 'git://github.com/vim-scripts/Conque-Shell.git'
        Bundle 'acx0/Conque-Shell.git'
        " tagbar should show scoped tags (if we have a file with several
        " classes then it will show each class methods under class and not
        " a list of classes and then a list of methods as taglist)
        " but this do not work for php
        " todo: try it with phpctags
        " see: https://github.com/techlivezheng/phpctags
        " and https://github.com/techlivezheng/tagbar-phpctags
        " Bundle 'majutsushi/tagbar'
        " depends: http://ctags.sourceforge.net/
        "Bundle 'git://github.com/int3/vim-taglist-plus.git'
        "Bundle 'git://github.com/rphillips/vim-zoomwin.git'
        "Bundle 'git://github.com/vim-scripts/UltiSnips.git'
        "Bundle 'git://github.com/msanders/snipmate.vim.git'
        "Bundle 'git://github.com/miripiruni/vimi-snippets.git'
        "Bundle 'git://github.com/tsaleh/vim-align.git'
        "Bundle 'git://github.com/vim-scripts/delimitMate.vim.git'
        "Bundle 'git://github.com/edsono/vim-matchit.git'
        "Bundle 'git://github.com/sjl/threesome.vim.git'
        "Bundle 'git://github.com/chrismetcalf/vim-yankring.git'
        "Bundle 'git://github.com/vim-scripts/vimwiki.git'
    " Lua
        "Bundle 'git://github.com/vim-scripts/lua.vim.git'
        "Bundle 'git://github.com/rkowal/Lua-Omni-Vim-Completion.git'
        "Bundle 'git://github.com/xolox/vim-lua-ftplugin.git'
        "Bundle 'git://github.com/xolox/vim-lua-inspect.git'
    " HTML/HAML
        "Bundle 'git://github.com/othree/html5.vim.git'
        "Bundle 'git://github.com/hokaccha/vim-html5validator.git'
        "Bundle 'git://github.com/tyru/operator-html-escape.vim.git'
        "Bundle 'git://github.com/tpope/vim-haml.git'
        "Bundle 'git://github.com/gregsexton/MatchTag.git'
    " CSS/LESS
        "Bundle 'git://github.com/hail2u/vim-css3-syntax.git'
        "Bundle 'git://github.com/skammer/vim-css-color.git'
        "Bundle 'git://github.com/groenewege/vim-less.git'
        "Bundle 'git://github.com/miripiruni/vim-better-css-indent.git'
        "Bundle 'git://github.com/miripiruni/CSScomb-for-Vim.git'
    " JavaScript
        Bundle 'git://github.com/pangloss/vim-javascript.git'
        Bundle 'git://github.com/itspriddle/vim-jquery.git'
        " ejs templates syntax highlight
        Bundle 'git://github.com/briancollins/vim-jst.git'
        " js syntax checks:
        " install jshint from here - https://github.com/jshint/node-jshint - supported by syntastic
    " JSON
        "Bundle 'git://github.com/leshill/vim-json.git'
    " Python/Django
        "Bundle 'git://github.com/fs111/pydoc.vim.git'
    " Perl
        "Bundle 'git://github.com/petdance/vim-perl.git'
        "Bundle 'git://github.com/ggray/vim-tt2.git'
    " Ruby/Rails
        "Bundle 'git://github.com/vim-ruby/vim-ruby.git'
        "Bundle 'git://github.com/tpope/vim-rails.git'
        "Bundle 'git://github.com/tpope/vim-endwise.git'
    " }
    filetype plugin indent on " load filetype plugins/indent settings

    set nobackup
    set noswapfile
    " set directory=~/.vimswap " directory to place swap files in

   " Colors {
        syntax on               " Turn syntax highlighting on.
        set t_Co=256            " 256 Colors.
        set background=dark     " Set dark background.
        "colorscheme zenburn
        "colorscheme blackboard

        " Solarized {
            syntax enable
            let g:solarized_termcolors=256
            let g:solarized_contrast="high"    "default value is normal
            let g:solarized_diffmode="high"    "default value is normal
            set background=dark
            try
                colorscheme solarized
            catch /^Vim\%((\a\+)\)\=:E185/
                echo "Solarized theme not found. Run :BundleInstall"
            endtry

            try
                call togglebg#map("<Leader>b")
            catch /^Vim\%((\a\+)\)\=:E117/
                " :(
            endtry
        " }
   " }

    " Font
    if has('win32') || has('win64')
        " set guifont=Monaco:h16
        " http://jeffmilner.com/index.php/2005/07/30/windows-vista-fonts-now-available/
        "set guifont=Consolas:h12:cANSI
        "set guifont=Consolas:h12:cRUSSIAN
        colorscheme default
        " highlight Normal ctermbg=black ctermfg=white
    elseif has('unix')
        "let &guifont="Monospace 10"
        set guifont=Inconsolata\ Medium\ 11
    endif

    " Highlight text over 79 chars
    " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    " match OverLength /\%79v.*/

    " GUI Settings {
    if has("gui_running")
        set guioptions+=ce
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        set guioptions-=T
        set mousehide " hide the mouse cursor when typing
    endif
    if has("gui_running")
        " GUI is running or is about to start.
        " Maximize gvim window.
        " this causes vim to run on 4th workspace in Unity
        " set lines=999 columns=999
    else
        " This is console Vim.
        if exists("+lines")
            set lines=50
        endif
        if exists("+columns")
            set columns=100
        endif
    endi
    " }

" }

" Spell {
    " enable spell by default
    " actually recommended way is to enable spell
    " setlocal spell spelllang=en_us
    set spell spelllang=ru_ru,en_us
    " z= - suggest word
    " [s - previous wrong word
    " ]s - next wrong word
" }

" General {
    set hidden                  " you can change buffers without saving

    set mouse=a                 " use mouse everywhere
    set mousemodel=popup        " right mouse btn=popup, select=Shift+left btn
    set mousehide               " hide mouse when typing

    set noerrorbells            " don't make noise
    set novisualbell            " don't blink
    set t_vb=

    set wildmenu                " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=longest,list
" }

" Langs and encodings {
    set fileformats=unix,dos,mac " support all three, in this order

    " Default text encoding
    if has('win32') || has('win64')
        set encoding=utf8
        "set termencoding=cp1251
    elseif has('unix')
        set encoding=utf8
        "set termencoding=utf-8
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

    highlight lCursor guifg=NONE guibg=Cyan
    set iminsert=0              " latin langmap by default when typing
    set imsearch=0              " latin langmap by default when search

    " Use English messages instead of translations
    language messages C
" }

" Search {
     set incsearch              " do highlight as you type you search phrase
     set hlsearch               " highlight search
     set ignorecase             " case insensitive by default
     set smartcase              " if there are caps, go case-sensitive
" }

" Vim UI {
     set cursorline             " highlight current line
     set guicursor=n:blinkon0   " turn off cursor blinking

     set wrap                   " wrap text, see http://vimcasts.org/episodes/soft-wrapping-text/
     set linebreak              " do not wrap in the middle of the word

     set laststatus=2           " always show the status line

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
     "Invisible character colors
     highlight NonText guifg=#4a4a59
     highlight SpecialKey guifg=#4a4a59

     set nostartofline          " leave my cursor where it was

     set number                 " turn on line numbers
     set numberwidth=5          " We are good up to 99999 lines
     set report=0               " tell us when anything is changed via :...
     set ruler                  " Always show current positions along the bottom
     set showmode               " Show editing mode

     "set scrolloff=10          " Keep 10 lines (top/bottom) for scope
     set scrolloff=999          " Work line is always in the middle
                                " alternative: zz - centers current line
     set sidescrolloff=10       " Keep 5 lines at the size

     set shortmess=aOstT        " shortens messages to avoid
                                " 'press a key' prompt
     set showcmd                " show the command being typed
     "set showmatch             " show matching brackets (slow)
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
" }

" Text Formatting/Layout {
    set expandtab               " expand tabs to spaces
    set smarttab                " When on, a <Tab> in front of a line inserts
                                " blanks according to 'shiftwidth'

    set shiftround              " when at 3 spaces, and I hit > ... go to 4, not 5
    set shiftwidth=4            " auto-indent amount when using cindent,
                                " >>, << and stuff like that
    set softtabstop=4           " when hitting tab or backspace, how many spaces
                                " should a tab be (see expandtab)
    set tabstop=4               " real tabs will show with set list on

    " set textwidth=80

    set formatoptions-=t        " Do not automatically wrap text on textwidth
    set formatoptions+=crq      " Automatically insert comment leader on return,
                                " and let gq format comments

    set infercase               " case inferred by default

    set autoindent              " indent next line like previous
    set smartindent             " smart indenting when starting a new line (after {, before }, etc)
    " allow to use backspace instead of "x"
    set backspace=indent,eol,start whichwrap+=<,>,[,]
    " Virtual editing means that the cursor can be positioned where there is
    " no actual character.  This can be halfway into a tab or beyond the end
    " of the line.  Useful for selecting a rectangle in Visual mode and
    " editing a table.
    set virtualedit=all
" }

" Folding {
    set foldenable              " Turn on folding
    set foldmarker={,}          " Fold C style code (only use this as default
                                " if you use a high foldlevel)
    set foldmethod=marker       " Fold on the marker
    set foldlevel=100           " Don't autofold anything (but I can still
                                " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
    "set foldopen=all

    " from https://github.com/sjl/dotfiles/blob/master/vim/.vimrc
    function! MyFoldText()
        let line = getline(v:foldstart)

        let nucolwidth = &fdc + &number * &numberwidth
        let windowwidth = winwidth(0) - nucolwidth - 3
        let foldedlinecount = v:foldend - v:foldstart

        " expand tabs into spaces
        let onetab = strpart(' ', 0, &tabstop)
        let line = substitute(line, '\t', onetab, 'g')

        let line = strpart(line, 0, windowwidth - 2 - len(foldedlinecount))
        let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
        return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
    endfunction
    set foldtext=MyFoldText()
" }

" Completions {
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
" }

" Plugins {
    " Fuzzy Finder
    " let g:fuf_modesDisable = []
    " Ack
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    " NERDTree
    let NERDTreeChDirMode=2     " Change CWD to nerd tree root
    let NERDTreeShowBookmarks=1 " Show bookmarks panel
    let NERDTreeShowHidden=1 " Show hidden files
    " Command-T
    let g:CommandTMatchWindowAtTop=1 " show window at top
    " easy tags
    "set tags=./tags;
    "let g:easytags_dynamic_files = 1
    "let g:easytags_by_filetype = 1
    "let g:easytags_by_filetype = 1
    let g:easytags_on_cursorhold = 0
" }
" Syntastic {
    let g:syntastic_phpcs_conf = "--standard=Seb"
    map <Leader>csd :let g:syntastic_phpcs_disable = 1<CR>
    " :let g:syntastic_phpmd_disable = 0<CR>
" }
" save as sudo
ca w!! w !sudo tee "%"

" Autocommands {
    au BufRead,BufNewFile *.phps    set filetype=php
    au BufRead,BufNewFile *.js      set filetype=javascript
    au BufRead,BufNewFile *.thtml   set filetype=php
    au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby
    au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
    au BufRead,BufNewFile {COMMIT_EDITMSG}                                set ft=gitcommit

    " S-k to open help
    autocmd BufNewFile,Bufread *.php set keywordprg="help"

    " Auto Completion
    autocmd FileType python :set omnifunc=pythoncomplete#Complete
    autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

    autocmd FileType php :set omnifunc=phpcomplete#CompletePHP
    autocmd FileType php setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

    autocmd FileType html :set omnifunc=htmlcomplete@CompleteTags
    autocmd FileType html :set filetype=xhtml
    autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

    autocmd FileType javascript :set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

    " autocmd FileType ruby :set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

    autocmd FileType css :set omnifunc=csscomplete#CompleteCSS
    autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

    autocmd FileType c :set omnifunc=ccomplete#Complete
    autocmd FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

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
    autocmd FileType c,cpp,java,php,python,vim,text,markdown,javascript,xhtml autocmd BufWritePre <buffer>
        \ call Preserve("%s/\\s\\+$//e")

    " When editing a file, always jump to the last known cursor porition.
    " Don't do it when the position is invalid or when inside an event
    " handler.
    au BufReadPost *
        \ if line("'\"") > 0 |
        \     if line("'\"") <= line("$") |
        \         exe("norm '\"") |
        \     else |
        \         exe "norm $" |
        \     endif|
        \ endif
" }


" Mappings {
    let mapleader = ","

    " Swap ; and :, use ;; as ;
    nnoremap ; :
    nnoremap ;; ;

    " map double leader to save
    map ,, :w<CR>

    " jj as ESC
    " other options: Ctrl-[, Ctrl-C
    imap jj <Esc>

    " ,vv to re-read .vimrc
    map <Leader>vv :call Preserve("source ~\/\.vimrc")<CR>
    " ,vc to edit .vimrc
    nmap <leader>vc :tabedit $MYVIMRC<CR>   " ,vc to view .vimrc

    " vim-easymotion
    " ,,w - words; ,,f - char
    " ,,t - search

    " vim-indent-guides
    " <Leader>ig

    " CtrlP
    let g:ctrlp_map = ',f'
    map <Leader>ff :CtrlPMixed<CR>
    map <Leader>fd :CtrlPDir<CR>
    map <Leader>fb :CtrlPBuffer<CR>
    map <Leader>ft :CtrlPBufTag<CR>
    map <Leader>fT :CtrlPTag<CR>
    map <Leader>fl :CtrlPLine<CR>
    map <Leader>fm :CtrlPMRU<CR>
    " to be able to call CtrlP with default search text
    function! CtrlPWithSearchText(search_text, ctrlp_command_end)
        execute ':CtrlP' . a:ctrlp_command_end
        call feedkeys(a:search_text)
    endfunction
    " CtrlP with default text
    nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
    nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
    nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
    "nmap ,d ,wg
    "nmap ,D ,wG
    nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
    nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
    nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
    " Don't change working directory
    "let g:ctrlp_working_path_mode = 0
    " Ignore files on fuzzy finder
    "let g:ctrlp_custom_ignore = {
    "\ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
    "\ 'file': '\.pyc$\|\.pyo$',
    "\ }

    " NERDTree
    map <Leader>nt :NERDTreeToggle<CR>" ,nt - toggle tree
    map <Leader>nf :NERDTreeFind<CR>" ,nf - find current file in the tree

    " Search and replace word under cursor
    "nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

    " Text encoding menu (koi8-r, cp1251, cp866, utf8)
    set wcm=<Tab>
    menu Encoding.koi8-r :e ++enc=koi8-r<CR>
    menu Encoding.windows-1251 :e ++enc=cp1251<CR>
    menu Encoding.cp866 :e ++enc=cp866<CR>
    menu Encoding.utf-8 :e ++enc=utf8 <CR>

    " Use CTRL-S for saving, also in Insert mode
    noremap <C-S> :update<CR>
    vnoremap <C-S> <C-C>:update<CR>
    inoremap <C-S> <C-O>:update<CR>

    " ,co - copen; ,n - cnext; ,p - cprevious
    " ]q and [q
    "nmap <Leader>co :copen<cr>
    "nmap <Leader>n :cnext<cr>
    "nmap <Leader>p :cprevious<cr>

    " add new line in normal mode
    " ]Space and [Space
    "nmap <Leader>o o<ESC>
    "nmap <Leader>O O<ESC>

    " Make last word uppercase
    imap <C-F> <Esc>gUiw`]a

    " ,8 File encoding for open
    " ucs-2le - MS Windows unicode encoding
    map <Leader>8 :execute RotateEnc()<CR>
    " <Shift+F8> Force file encoding for open (encoding = fileencoding)
    map <S-F8> :execute ForceRotateEnc()<CR>
    " <Ctrl+F8> File encoding for save (convert)
    map <C-F8> :execute RotateFEnc()<CR>

    " " F11 - Taglist window
    map <Leader>tg :TlistToggle<cr>

    " windows navigation
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
    "
    "nmap <C-k> <C-W>k<C-W>_        " window up
    "imap <C-k> <Esc><C-W>k<C-W>_a  " window up
    "nmap <C-j> <C-W>j<C-W>_        " window down
    "imap <C-j> <Esc><C-W>j<C-W>_a  " window down

    " Move cursor by display lines when wrapping
    " http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
    noremap k gk
    noremap j gj
    "noremap 0 g0
    "noremap $ g$

    " Move with Ctrl + hjkl in Insert mode
    imap <C-h> <C-o>h
    imap <C-j> <C-o>j
    imap <C-k> <C-o>k
    imap <C-l> <C-o>l

    "space to scroll 10 lines down, backspace - 10 lines up
    "zz - centers current line
    nnoremap <space> 10jzz
    nnoremap <backspace> 10kzz

    " Shortcut to rapidly toggle `set list` (def leader = \)
    nmap <leader>l :set list!<CR>

    "" Supertab
    " Tab for auto-complete
    " let g:SuperTabDefaultCompletionType = '<C-x><C-o>'

    " phpDocumenter
    inoremap <Leader>pd <ESC>:call PhpDocSingle()<CR>i
    nnoremap <Leader>pd :call PhpDocSingle()<CR>
    vnoremap <Leader>pd :call PhpDocRange()<CR>
     " Default values
    let g:pdv_cfg_Package = "app"
    let g:pdv_cfg_Version = ""
    let g:pdv_cfg_Author = "Boris Serebrov"
    let g:pdv_cfg_Copyright = ""
    let g:pdv_cfg_License = ""

    " http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
    " remove trailing spaces
    nmap _$ :call preserve("%s/\\s\\+$//e")<cr>
    " autoformat file
    nmap _= :call preserve("normal gg=g")<cr>

    " Standard keys
        " Speller shorcuts {
            " z= - suggest word
            " [s - previous wrong word
            " ]s - next wrong word
        " }
        " Folding {
            " za - open/close current fold
            " zR - open all folds
            " zM - close all folds
        " }
        " History {
            " http://vim.wikia.com/wiki/Using_command-line_history
            " q: for commands
            " q/ for searches
            " or type : or / to start entering a command or search,
            " then press the 'cedit' key (default is Ctrl-f :help 'cedit').
        " }
        " gv - select last visual area and go to visual mode

" }

" Session manager {
    " default: blank,buffers,curdir,folds,help,options,tabpages,winsize"
    set sessionoptions=buffers,curdir,help,tabpages,winsize " localoptions,
    " default: '100,<50,s10,h
    set viminfo=!,'100,/50,:50,<50,@50,h,s10

    map <Leader>s :SessionList<CR>
    " load last session on start
    autocmd VimEnter *  call RestoreLastSessionMan()

    function! RestoreLastSessionMan()
        " Check that the user has started Vim without editing any files.
        if bufnr('$') == 1 && bufname('%') == '' && !&mod && getline(1, '$') == ['']
            :SessionOpenLast
        endif
    endfunction
" }

" Diff current unsaved file {
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
" }

" Find and replace in multiple files {
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

" }

" Utils {
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

function! PylintReport()
    setlocal makeprg=(echo\ '[%]';\ pylint\ %)
    setlocal efm=%+P[%f],%t:\ %#%l:%m
    silent make
    cwindow
    exe "!clear"
    exe ":redraw!"
endfunction

" }

" --------------  links --------------------
" vimrc {
"   http://www.vi-improved.org/vimrc.php
"   http://www.slackorama.com/projects/vim/vimrc.html
" }

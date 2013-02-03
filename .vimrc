" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    filetype off

    " vundle {
        set rtp+=~/.vim/bundle/vundle/
        call vundle#rc()

        " Brief help
        " :BundleList          - list configured bundles
        " :BundleInstall(!)    - install(update) bundles
        " :BundleSearch(!) foo - search(or refresh cache first) for foo
        " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
        "
        " let Vundle manage Vundle
        Bundle 'gmarik/vundle'
    " }
    " https://github.com/mutewinter/dot_vim
    " My Bundles here {
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
        Bundle 'tpope/vim-unimpaired'
        "Vim sugar for the UNIX shell commands that need it the most. Commands include:
        " :Unlink: Delete a buffer and the file on disk simultaneously.
        " :Remove: Like :Unlink, but doesn't require a neckbeard.
        " :Move: Rename a buffer and the file on disk simultaneously.
        " :Chmod: Change the permissions of the current file.
        " :Find: Run find and load the results into the quickfix list.
        " :Locate: Run locate and load the results into the quickfix list.
        " :SudoWrite: Write a privileged file with sudo.
        " :W: Write every open window. Handy for kicking off tools like guard.
        Bundle 'tpope/vim-eunuch'
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
        " NERDTree
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
        "Bundle 'UltiSnips'
        " At every search command, it automatically prints
        " "At match #N out of M matches".
        Bundle 'IndexedSearch'
        " CtrlP
        Bundle 'kien/ctrlp.vim'

        " :Multichange and then cw to change word in a whole file (or any
        " other cxx command)
        Bundle 'AndrewRadev/multichange.vim'
        " disable mapping entirely
        let g:multichange_mapping = ''
        "
        " PHP
        " ====
        " php completion - it should be copied to autoload/phpcomplete.vim
        Bundle 'shawncplus/phpcomplete.vim'
        " php 5.3 syntax
        Bundle 'vim-scripts/php.vim--Garvin'
        Bundle '2072/PHP-Indenting-for-VIm'
        " view php docs with K
        Bundle 'mudpile45/vim-phpdoc'
        Bundle 'mikehaertl/yii-api-vim'
        " php documenter
        Bundle 'mikehaertl/pdv-standalone'
        Bundle 'joonty/vdebug'
        Bundle 'joonty/vim-phpunitqf'
        Bundle 'joonty/vim-taggatron'
        " ...
        "
        " CamelCase and under_score motions
        Bundle 'bkad/CamelCaseMotion'
        " Defines 'indentation' text object
        " https://github.com/michaeljsmith/vim-indent-object

       "
        "" Interface
        Bundle 'vim-scripts/taglist.vim.git'
        Bundle 'tyru/open-browser.vim'
        Bundle 'Shougo/neocomplcache'
        Bundle 'Shougo/neosnippet'
        Bundle 'Shougo/unite.vim'

         " Gundo.vim is Vim plugin to visualize your Vim undo tree.
        Bundle 'sjl/gundo.vim'
        Bundle 'Shougo/vimfiler'

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
        Bundle 'pangloss/vim-javascript.git'
        Bundle 'itspriddle/vim-jquery.git'
        " ejs templates syntax highlight
        Bundle 'briancollins/vim-jst.git'
    " JSON
        "Bundle 'git://github.com/leshill/vim-json.git'
    " Ruby/Rails
        "Bundle 'git://github.com/vim-ruby/vim-ruby.git'
        "Bundle 'git://github.com/tpope/vim-rails.git'
        "Bundle 'git://github.com/tpope/vim-endwise.git'
    " }
    filetype plugin indent on " load filetype plugins/indent settings
    syntax on               " Turn syntax highlighting on.

    set nobackup
    set noswapfile

    set history=64
    set undolevels=128
    " try to create undo dir, skip error if exists
    silent !mkdir ~/.vim_undo > /dev/null 2>&1
    set undodir=~/.vim_undo/
    set undofile
    set undolevels=1000
    set undoreload=10000

   " Colors {
        set background=dark
        " Solarized {
            let g:solarized_termcolors=256
            let g:solarized_contrast="high"    "default value is normal
            let g:solarized_diffmode="high"    "default value is normal
            try
                colorscheme solarized
            catch /^Vim\%((\a\+)\)\=:E185/
                echo "Solarized theme not found. Run :BundleInstall"
            endtry
        " }
   " }

    " Font
    "if has('win32') || has('win64')
        "colorscheme default
    "elseif has('unix')
        "set guifont=Monospace\ 10
        ""set guifont=Inconsolata\ Medium\ 11
    "endif

    " GUI Settings {
    if has("gui_running")
        " use simple dialogs rather than pop-ups
        set guioptions+=c
        " do not use GUI tabs, use console style tabs
        set guioptions-=e
        set guioptions-=T
        set guioptions-=m
        set guioptions-=r
    endif
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
    " Ack
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    " NERDTree
    let NERDTreeChDirMode=2     " Change CWD to nerd tree root
    "let NERDTreeShowBookmarks=1 " Show bookmarks panel
    let NERDTreeShowHidden=1 " Show hidden files
    let NERDTreeIngore=['\~$', '\.pyc']
    let NERDTreeQuitOnOpen = 1
    let NERDTreeHijackNetrw = 1


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
    nmap <leader>vc :tabedit $MYVIMRC<CR>

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
    map <Leader>fT :CtrlPBufTag<CR>
    map <Leader>ft :CtrlPTag<CR>
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
    " Don't clear cache on exit
    let g:ctrlp_clear_cache_on_exit = 0
    " by default it is 'Et' which means it will jump to another tab if you
    " open already opened buffer in current tab
    let g:ctrlp_switch_buffer = 'et'

    " NERDTree
    function! NerdFindFile(file)
        execute ':e ' . fnamemodify(a:file, ':h')
        execute '/' . fnamemodify(a:file, ':t')
    endfunction
    function! NerdFindDir(dir)
        echo a:dir
        execute ':e ' . a:dir
        execute '/' . escape(a:dir, '/')
    endfunction
    "map <Leader>nt :NERDTreeToggle<CR>" ,nt - toggle tree
    "map <Leader>nf :NERDTreeFind<CR>" ,nf - find current file in the tree
    "map <Leader>nt :execute ':e '.getcwd()<CR>
    map <Leader>nt :call NerdFindDir(getcwd())<CR>
    map <Leader>nf :call NerdFindFile(expand('%'))<CR>

    " Search and replace word under cursor
    "nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

    " Text encoding menu (koi8-r, cp1251, cp866, utf8)
    set wcm=<Tab>
    menu Encoding.koi8-r :e ++enc=koi8-r<CR>
    menu Encoding.windows-1251 :e ++enc=cp1251<CR>
    menu Encoding.cp866 :e ++enc=cp866<CR>
    menu Encoding.utf-8 :e ++enc=utf8 <CR>

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
    " Use CTRL-N to remove search highlight
    noremap <C-N> :noh<CR>
    vnoremap <C-N> <C-C>:noh<CR>gv
    " CTRL-N in insert mode is a completion!!!
    " inoremap <C-N> <C-O>:noh<CR>

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
     map <c-j> <c-w>j
     map <c-k> <c-w>k
     map <c-l> <c-w>l
     map <c-h> <c-w>h

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

    "Debugger
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
        call OpenBrowser(url)
        python debugger.run()
    endfunction
    command! -nargs=1 Debug call Debug('<args>')
    function! DebugPy(...)
        let str_args = join(a:000, ' ')
        let last_cmd = '!python -S ~/pydbgp/bin/pydbgp -d localhost:9000 -k vim_debug ' . str_args
        execute 'silent !echo "' . str_args . '" > ~/vim.last.arg.txt &'
        execute 'silent !echo "' . last_cmd . '" > ~/vim.last.cmd.txt &'
        execute 'silent ' . last_cmd . ' > ~/vim.last.out.txt 2> ~/vim.last.err.txt &'
        python debugger.run()
    endfunction
    command! -nargs=* DebugPy call DebugPy('% <args>')
    function! DebugPhpunit(...)
        let str_args = join(a:000, ' ')
        let last_cmd = '!export XDEBUG_CONFIG="idekey=vim_debug" && sleep 2 && phpunit ' . str_args
        execute 'silent !echo "' . str_args . '" > ~/vim.last.arg.txt &'
        execute 'silent !echo "' . last_cmd . '" > ~/vim.last.cmd.txt &'
        execute 'silent ' . last_cmd . ' > ~/vim.last.out.txt 2> ~/vim.last.err.txt &'
        python debugger.run()
    endfunction
    " Note: if bootstrap should be used then change vim current folder to the
    " folder with bootstrap
    command! -nargs=* DebugPhpunit call DebugPhpunit('<args> %')
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

    "Taggatron
    let g:tagcommands = {
    \    "python" : {"tagfile": ".python.tags", "args": "-R"},
    \    "php" : {"tagfile":".php.tags","args":"-R"},
    \    "javascript" : {"tagfile":".js.tags","args":"-R"}
    \}
    let g:taggatron_verbose = 0

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

" Visual search {
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

" Launches neocomplcache automatically on vim startup.
let g:neocomplcache_enable_at_startup = 1
"
let g:neocomplcache_enable_cursor_hold_i = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underscore completion.
let g:neocomplcache_enable_underbar_completion = 1
" Sets minimum char length of syntax keyword.
let g:neocomplcache_min_syntax_length = 3
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define file-type dependent dictionaries.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword, for minor languages
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion. Not required if they are already set elsewhere in .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion, which require computational power and may stall the vim.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" --------------  links --------------------
" vimrc {
"   http://www.vi-improved.org/vimrc.php
"   http://www.slackorama.com/projects/vim/vimrc.html
" }

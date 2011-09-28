" Basics {
    set nocompatible " explicitly get out of vi-compatible mode

    " pathogen {
        filetype off
        call pathogen#infect()
        call pathogen#helptags()
    " }

    filetype plugin indent on " load filetype plugins/indent settings

    set directory=~/.vimswap " directory to place swap files in

   " Colors {
        set t_Co=256                        " 256 Colors.
        set background=dark                 " Set dark background.
        syntax on                           " Turn syntax highlighting on.
        colorscheme zenburn                 " Set colorscheme to zenburn.
        "colorscheme blackboard
   " }

    " Font. Very important.
    if has('win32') || has('win64')
        " set guifont=Monaco:h16
        " http://jeffmilner.com/index.php/2005/07/30/windows-vista-fonts-now-available/
        "set guifont=Consolas:h12:cANSI
        "set guifont=Consolas:h12:cRUSSIAN
        colorscheme ir_black
    elseif has('unix')
        "let &guifont="Monospace 10"
    endif

    "" Highlight text over 79 chars
    " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    " match OverLength /\%79v.*/

    " GUI Settings {
    if has("gui_running")
        set columns=180 " perfect size for me
        set lines=55 " perfect size for me
        set guioptions+=ce
        "              ||
        "              |+-- use simple dialogs rather than pop-ups
        "              +  use GUI tabs, not console style tabs
        set mousehide " hide the mouse cursor when typing
    endif
    " }

" }

" Spell {
    "set spl=en spell
    setlocal spell spelllang=ru_yo,en_us
" }

" General {
    " Не выгружать буфер, когда переключаемся на другой
    " Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
    " когда переключаешься между ними
    set hidden " you can change buffers without saving

    set mouse=a " use mouse everywhere
    " по правой кнопке - popup меню, расширить выделение - Shift+левая кнопка
    set mousemodel=popup
    " " Скрывать указатель мыши, когда печатаем
    set mousehide

    set noerrorbells " don't make noise

    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    "set wildmode=list:longest " turn on wild mode huge list
    set wildmode=longest,list
" }

" Langs and encodings {
    set fileformats=unix,dos,mac " support all three, in this order

    "" Кодировка текста по умолчанию
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
    " настраиваю для работы с русскими словами (чтобы w, b, * понимали
    " русские слова)
    "set iskeyword=@,48-57,_,192-255 "this is default
    " (XXX: #VIM/tpope warns the line below could break things)
    "?? set iskeyword+=_,$,@,%,# " none of these are word dividers

    " по умолчанию - латинская раскладка
    set iminsert=0
    " по умолчанию - латинская раскладка при поиске
    set imsearch=0

    highlight lCursor guifg=NONE guibg=Cyan

" }

" Vim UI {
     set cursorline " highlight current line
     set incsearch " BUT do highlight as you type you
                   " search phrase
     " set nohlsearch " do not highlight searched for phrases
     " highlight search
     set hls

     set ignorecase " case insensitive by default
     set smartcase " if there are caps, go case-sensitive

     set laststatus=2 " always show the status line
     "?? set linespace=0 " don't insert any extra pixel lines
                     " betweens rows

     set list " we do what to show tabs, to ensure we get them
               " out of my files
     set listchars=tab:>-,trail:- " show tabs and trailing
     if has("gui_running")
         set listchars=tab:▸\ ,trail:·,eol:¬
     endif
     "Invisible character colors
     highlight NonText guifg=#4a4a59
     highlight SpecialKey guifg=#4a4a59
     " Shortcut to rapidly toggle `set list` (def leader = \)
     nmap <leader>l :set list!<CR>

     set nostartofline " leave my cursor where it was

     set novisualbell " don't blink
     set t_vb=

     set number " turn on line numbers
     set numberwidth=5 " We are good up to 99999 lines
     set report=0 " tell us when anything is changed via :...
     set ruler " Always show current positions along the bottom
     " Show editing mode
     set showmode

     set scrolloff=10 " Keep 10 lines (top/bottom) for scope
     "" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться
     " в режиме редактирования
     "set scrolljump=7

     set shortmess=aOstT " shortens messages to avoid
                          " 'press a key' prompt
     set showcmd " show the command being typed
     "?? set showmatch " show matching brackets
     set sidescrolloff=10 " Keep 5 lines at the size
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

    " Status line
    "set laststatus=2
    "set statusline=
    "set statusline+=%-3.3n\                         " buffer number
    "set statusline+=%f\                             " filename
    "set statusline+=%h%m%r%w                        " status flags
    "set statusline+=\[%{strlen(&ft)?&ft:'none'}]    " file type
    "set statusline+=%=                              " right align remainder
    "set statusline+=0x%-8B                          " character value
    "set statusline+=%-14(%l,%c%V%)                  " line, character
    "set statusline+=%<%P                            " file position

"
" }

" Text Formatting/Layout {
    set expandtab " no real tabs please!
    "" Умные табы в начале строк
    set smarttab

    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set shiftwidth=4 " auto-indent amount when using cindent,
                      " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces
                       "should a tab be (see expandtab)
    set tabstop=4 " real tabs will show with set list on

    " set textwidth=80

    set formatoptions-=t   " Do not automatically wrap text on textwidth
    set formatoptions+=crq " Automatically insert comment leader on return,
                           " and let gq format comments

    set infercase " case inferred by default
    set nowrap " do not wrap line
    " Включить автоотступы
    set autoindent
    " Включаем "умные" отспупы ( например, автоотступ после {)
    set smartindent
    " allow to use backspace instead of "x"
    set backspace=indent,eol,start whichwrap+=<,>,[,]
    " Virtual editing means that the cursor can be positioned where there is
    " no actual character.  This can be halfway into a tab or beyond the end
    " of the line.  Useful for selecting a rectangle in Visual mode and
    " editing a table.
    set virtualedit=all
" }

" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default
                        " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=100 " Don't autofold anything (but I can still
                      " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                      " open folds
    set foldopen=all

    function! SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function
                                   " (cleaner than default)
" }

" Completions {
    set completeopt=longest,menuone,preview " use a pop up menu for completions
    set complete=""    " what use for completions
    set complete+=.    " current buffer
    set complete+=t    " tags
    set complete+=k    " dictionary
    set complete+=b    " other open buffers

    " tag files
    " ';/' - this will look in the current directory for "tags", and work up the tree towards root until one is found
    set tags=tags;/

" }


" Mappings {
    let mapleader = ","
    imap jj <Esc>

    map <Leader>cc :source ~/.vimrc<CR>

    " Fuzzy Finder
    map <Leader>ff :FufFile<CR>
    map <Leader>fd :FufDir<CR>
    map <Leader>fb :FufBuffer<CR>
    map <Leader>ft :FufTag<CR>

    "" Поиск и замена слова под курсором
    "nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

    " " Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
    set wcm=<Tab>
    menu Encoding.koi8-r :e ++enc=koi8-r<CR>
    menu Encoding.windows-1251 :e ++enc=cp1251<CR>
    menu Encoding.cp866 :e ++enc=cp866<CR>
    menu Encoding.utf-8 :e ++enc=utf8 <CR>

    " ,co - copen
    nmap <Leader>co :copen<cr>
    nmap <Leader>n :cnext<cr>
    nmap <Leader>p :cprevious<cr>

    " <F8> File encoding for open
    " ucs-2le - MS Windows unicode encoding
    map <Leader>8	:execute RotateEnc()<CR>

    " <Shift+F8> Force file encoding for open (encoding = fileencoding)
    map <S-F8>	:execute ForceRotateEnc()<CR>

    " <Ctrl+F8> File encoding for save (convert)
    map <C-F8>	:execute RotateFEnc()<CR>

    " " F11 - показать окно Taglist
    "map <A-0> :TlistToggle<cr>

    " tab navigation
    "map <C-l> :tabnext<cr>
    "map <C-h> :tabprevious<cr>
    "map <C-t> :tabnew<cr>
    "map <C-x> :tabclose<cr>

    "imap <C-t> <C-O>:tabnew<cr>
    "imap <C-l> <C-O>:tabnext<cr>
    "imap <C-h> <C-O>:tabprevious<cr>
    "imap <C-x> <C-O>:tabclose<cr>

    "vmap <C-t> <C-C>:tabnew<cr>
    "vmap <C-l> <C-C>:tabnext<cr>
    "vmap <C-h> <C-C>:tabprevious<cr>
    "vmap <C-x> <C-C>:tabclose<cr>

    " навигация по окнам - активное окно разворачивается
    "nmap <C-k> <C-W>k<C-W>_ " окно вверх
    "imap <C-k> <Esc><C-W>k<C-W>_a " окно вверх
    "nmap <C-j> <C-W>j<C-W>_ " окно вниз
    "imap <C-j> <Esc><C-W>j<C-W>_a " окно вниз

    "map <silent> <F4> :w<CR>:!/usr/bin/env python % <CR>

    "" Supertab

" }

" Autocommands {
    au BufRead,BufNewFile *.phps    set filetype=php
    au BufRead,BufNewFile *.thtml   set filetype=php

    " remove trailing whitespace on save
    " http://vim.wikia.com/wiki/Remove_unwanted_spaces
    autocmd FileType c,cpp,java,php,python,vim autocmd BufWritePre <buffer>
        \ call setline(1,map(
        \    getline(1,"$"),'substitute(v:val,"\\s\\+$","","")')
        \ )

    "" When editing a file, always jump to the last known cursor porition.
    "" Don't do it when the position is invalid or when inside an event
    "" handler.
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \       exe "normal! g`\"" |
        \ endif

    " Ruby {
        " ruby standard 2 spaces, always
"        au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2
"        au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2
    " }

    " Python
    augroup vimrcEx                 " Put in an autocmd group
        au!

        "" Auto Completion
        autocmd FileType python :set omnifunc=pythoncomplete#Complete
        "autocmd FileType php :set omnifunc=phpcomplete#CompletePHP
        autocmd FileType html :set omnifunc=htmlcomplete@CompleteTags
        autocmd FileType html :set filetype=xhtml
        autocmd FileType javascript :set omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType css :set omnifunc=csscomplete#CompleteCSS
        autocmd FileType c :set omnifunc=ccomplete#Complete

        "" Python Syntax
        " autocmd BufWrite *.{py} :call CheckPythonSyntax()

    augroup END


" }

" Tab for auto-complete
let g:SuperTabDefaultCompletionType = '<C-x><C-o>'

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

    "function! SaveLastSession()
    "    let last_session_file = glob(g:sessions_data_path) . '.last_session.txt'
    "    if v:this_session != ""
    "        call writefile([v:this_session], last_session_file)
    "        call SessionSave()
    "    endif
    "endfunction

    "function! RestoreLastSession()
    "    let last_session_file = glob(g:sessions_data_path) . '.last_session.txt'
    "    " Check that the user has started Vim without editing any files.
    "    if bufnr('$') == 1 && bufname('%') == '' && !&mod && getline(1, '$') == ['']
    "        if filereadable(last_session_file)
    "            exec "source " . readfile(last_session_file)[0]
    "        endif
    "    endif
    "endfunction
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

function! CheckPythonSyntax()
    setlocal makeprg=(echo\ '[%]';\ pylint\ --reports=n\ %)
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


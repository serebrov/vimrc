" Plugins {{{
  " set nocompatible " explicitly get out of vi-compatible mode
  " filetype off

  call plug#begin('~/.vim/plugged')

  """""" UI
  " sensible defaults
  Plug 'tpope/vim-sensible'
  " Hard mode - no jjjjj and kkkkk, :HardTimeToggle to toggle
  let g:hardtime_allow_different_key = 1
  let g:list_of_normal_keys = ["h", "j", "k", "l"]
  let g:list_of_visual_keys = ["h", "j", "k", "l"]
  Plug 'takac/vim-hardtime'
  autocmd BufEnter * HardTimeOn
  " auto adjust tab/space settings based on current file
  Plug 'tpope/vim-sleuth'
  " Additional features for netrw
  "  -  to open browser focused on current file, - again to go upper
  "  .  to put selected file name to the end of command line;
  "  !  to do the same and start command line with !
  "  ~  go home; cd/cl - :cd / :lcd
  Plug 'tpope/vim-vinegar'
  " :Matchmaker - dynamically highlight word under the cursor,
  "               move the cursor and it will highlight the different word
  " :Matchmaker! to turn it off
  Plug 'qstrahl/vim-matchmaker'
  " On search automatically prints "At match #N out of M matches".
  Plug 'henrik/vim-indexed-search'
  " better search hightlights
  Plug 'haya14busa/incsearch.vim'
  " similar: https://github.com/junegunn/vim-oblique/
  map /  <Plug>(incsearch-forward)\v
  map ?  <Plug>(incsearch-backward)\v
  " Setup for vim-indexed-search
  " See: https://github.com/haya14busa/incsearch.vim/issues/21
  let g:indexed_search_mappings = 0
  augroup incsearch-indexed
    autocmd!
    autocmd User IncSearchLeave ShowSearchIndex
  augroup END
  nnoremap <silent>n nzv:ShowSearchIndex<CR>
  nnoremap <silent>N Nzv:ShowSearchIndex<CR>
  "set hlsearch
  let g:incsearch#auto_nohlsearch = 1
  map n  <Plug>(incsearch-nohl-n)zv:ShowSearchIndex<CR>
  map N  <Plug>(incsearch-nohl-N)zv:ShowSearchIndex<CR>
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

  " rainbow parenthesis
  " Note: doesn't work for php due some specifics in the syntax file
  " it doesn't work with default syntax file and with extended versions
  " (https://github.com/vim-scripts/php.vim--Garvin) and (https://github.com/StanAngeloff/php.vim)
  " maybe this can be fixed?
  " see https://defuse.ca/blog/vim-rainbow-parentheses-work-in-php
  Plug 'kien/rainbow_parentheses.vim'

  " Semantic highlighting
  " See: http://www.reddit.com/r/vim/comments/23qy7j/semantic_highlighting/
  "      https://medium.com/@evnbr/coding-in-color-3a6db2743a1e
  "      http://stackoverflow.com/questions/21425279/is-there-a-vim-plugin-for-semantics-syntax-highlighting
  "      http://stackoverflow.com/questions/21383532/vim-variable-syntax-highlighting
  "      https://github.com/bigfish/vim-js-context-coloring
  "      https://plus.google.com/+DouglasCrockfordEsq/posts/FzKnHk96m2C
  "
  " :SemanticHighlightToggle - on/off
  Plug 'jaxbot/semantic-highlight.vim'

  " :NR to move selected text into scratch buffer, :w to put modified text
  " back
  Plug 'chrisbra/NrrwRgn'

  Plug 'kien/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'tacahiroy/ctrlp-funky'
  " Also need `set path=.,**` (see below) to search recursively
  noremap <Leader>i :find<SPACE>
  noremap <Leader>f :CtrlP<CR>
  noremap <Leader>u :CtrlPFunky<CR>
  " PyMatcher for CtrlP
  if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
  else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
  endif
  " http://stackoverflow.com/questions/18285751/use-ag-in-ctrlp-vim
  if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    " --hidden to search dot files, but it also reveals .git, so ignore
    "  it explicitly
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''node_modules'' --hidden -g ""'
  endif
  " Note: per-project config can look like this (add to .vimrc.local):
  " let g:ctrlp_custom_ignore = {
  " \ 'dir': '\v[\/](' . join([
  "       \ 'build',
  "       \ ], '|') . ')$',
  " \ 'file': '\v\.(exe|so|dll)$',
  " \ }
  let g:ctrlp_switch_buffer = 'vt'
  " Set delay to prevent extra search
  let g:ctrlp_lazy_update = 350
  " Do not clear filenames cache, to improve CtrlP startup
  " You can manualy clear it by <F5> when ctrlp is opened, <F7> to clear MRU
  let g:ctrlp_clear_cache_on_exit = 0
  " Set no file limit, we are building a big project
  let g:ctrlp_max_files = 0

  " If ag is available use it as filename list generator instead of 'find'
  if executable("ag")
      set grepprg=ag\ --nogroup\ --nocolor
  endif

  " Suggest to open existing file instead of creating new one when there
  " are multiple matches
  Plug 'EinfachToll/DidYouMean'

  " :Ag  - ag integration
  Plug 'rking/ag.vim'

  Plug 'bling/vim-airline'
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

  " adopt color schemes for terminal
  Plug 'godlygeek/csapprox'
  " Solarized color scheme
  Plug 'altercation/vim-colors-solarized'
  Plug 'sjl/badwolf'
  Plug 'nanotech/jellybeans.vim'
  Plug 'noahfrederick/vim-hemisu'

  "  http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
  "  v to select one character
  "  v again to expand selection to word
  "  v again to expand to paragraph
  "  ...
  "  <C-v> go back to previous selection if I went too far
  Plug 'terryma/vim-expand-region'
  vmap v <Plug>(expand_region_expand)
  vmap <C-v> <Plug>(expand_region_shrink)

  " Move / duplicate text
  " space + d / D - duplicate down/up
  " visual mode - arrows - move selection
  " F10 - toggle replace/insert
  Plug 't9md/vim-textmanip'
  xmap <Space>d <Plug>(textmanip-duplicate-down)
  nmap <Space>d <Plug>(textmanip-duplicate-down)
  xmap <Space>D <Plug>(textmanip-duplicate-up)
  nmap <Space>D <Plug>(textmanip-duplicate-up)

  xmap <Down> <Plug>(textmanip-move-down)
  xmap <Up> <Plug>(textmanip-move-up)
  xmap <Left> <Plug>(textmanip-move-left)
  xmap <Right> <Plug>(textmanip-move-right)

  " toggle insert/replace with <F10>
  nmap <F10> <Plug>(textmanip-toggle-mode)
  xmap <F10> <Plug>(textmanip-toggle-mode)

  " Vim / tmux splits integration
  " <ctrl-h> => Left
  " <ctrl-j> => Down
  " <ctrl-k> => Up
  " <ctrl-l> => Right
  " <ctrl-\> => Previous split
  Plug 'christoomey/vim-tmux-navigator'
  ":Tmux lets you call any old tmux command (with really good tab complete).
  ":Tyank and :Tput give you direct access to tmux buffers.
  ":Twrite sends a chunk of text to another pane. Give an argument like windowtitle.2, top-right, or last, or let it default to the previously given argument.
  ":Tattach lets you use a specific tmux session from outside of it.
  Plug 'tpope/vim-tbone'

  " Note: compare with tbone - :Twrite 1.2 also sends text to another
  "       tmux pane
  " Repl for vim
  " Ctrl-c c - run code in other tmux pane (set :1.2 for win 1 pane 2)
  " See: http://vimeo.com/34184155 and https://technotales.wordpress.com/2007/10/03/like-slime-for-vim/
  " Can be used for anything: python, node, bash, mysql, etc
  "Plug 'jpalardy/vim-slime'
  "let g:slime_target = "tmux"
  "let g:slime_python_ipython = 1

  " Manage files and directories in vim
  " :Vimdir [directory] - To list files and folders
  " :VimdirR [directory] - To list files and folders recursive
  Plug 'c0r73x/vimdir.vim'

  " Ensure dir exists before save the file
  " :e some_new_dir/some_new_file and then :w will work
  Plug 'dockyard/vim-easydir'

  """""" Git
  " git support:
  " :Gedit, Gdiff, Gstatus, Gcommit, Gblame, Gmove, Gremove
  " :Ggrep, Glgrep, Glog, Gread, Gwrite, Gbrowse
  " Search in a specific directory:
  " :Ggrep searchterm -- foldername | copen
  " Search specific file types:
  " :Ggrep searchterm -- '*.ext' | copen
  " Git setup:
  "  mergetool.fugitive.cmd=gvim -f -c Gdiff $MERGED
  "  mergetool.fugitive.trustexitcode=true
  Plug 'tpope/vim-fugitive'
  " :Gitv - git history viewer
  Plug 'gregsexton/gitv'
  " :Extradite - git browser
  Plug 'int3/vim-extradite'
  " Merge tool, see http://sjl.bitbucket.org/splice.vim/
  " git setup:
  "  mergetool.splice.cmd=gvim -f $BASE $LOCAL $REMOTE $MERGED -c 'SpliceInit'
  "  mergetool.splice.trustexitcode=true
  " Splice commands are called via 'g:splice_previx' ('-' by default)
  Plug 'sjl/splice.vim'
  " Shows +/- for git changes
  "  off :GitGutterDisable, on :GitGutterEnable, toggle :GitGutterToggle
  " Jump between diffs: ]c/[c
  Plug 'airblade/vim-gitgutter'
  "   :DirDiff <A:Src Directory> <B:Src Directory>
  "   see http://www.vim.org/scripts/script.php?script_id=102
  Plug 'zhaocai/DirDiff.vim'

  """""" Motions / normal mode commands
  " CamelCase and under_score motions: ,w ,b ,e and i,w i,b i,e
  Plug 'bkad/CamelCaseMotion'
  "  VimTextObj provides a text object for function arguments.
  " aa – an argument, ia – inner argument
  " Plug 'vim-scripts/argtextobj.vim'
  " :SidewaysLeft and :SidewaysRight - move the item under the cursor left or right, where an "item" is defined by a delimiter
  Plug 'AndrewRadev/sideways.vim'
  " note: for now define to h/l to get rid of by char movement habbit
  nnoremap <Leader>hh :SidewaysLeft<cr>
  nnoremap <Leader>ll :SidewaysRight<cr>
  " aa – an argument, ia – inner argument
  omap aa <Plug>SidewaysArgumentTextobjA
  xmap aa <Plug>SidewaysArgumentTextobjA
  omap ia <Plug>SidewaysArgumentTextobjI
  xmap ia <Plug>SidewaysArgumentTextobjI

  " Python indent object
  " ai – the current indentation level and the line above
  " ii – the current indentation level excluding the line above
  Plug 'michaeljsmith/vim-indent-object'
  " ic, ac, iC, aC text object for columns
  " ic / iC based on inner word / WORD (iw / iW),
  " ac / aC - on "a word" / "a WORD" (aw / aW)
  " like vic - select a col / dic - delete a col / cic - change a col
  "      vicI - prepend text to col / vicA - append text
  Plug 'coderifous/textobj-word-column.vim'
  " Required by vim-surround
  Plug 'tpope/vim-repeat'
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
  Plug 'tpope/vim-surround'
  " Pair commands, some of them:
  " [q / ]q, [Q / ]Q- :cprevious / :cnext, :cfirst / :clast - errors in quickfix
  " [<C-Q> / ]<C-Q> - :cpfile / :cnfile - prev / next file in quickfix list
  " [l / l], [L / L] - :lprevious / :lnext, :lfirst / :llast  - location list
  " [<C-L> / ]<C-L> - :lpfile / :lnfile - prev / next file in location list
  " Quickfix notes:
  "  - (superuseful) :cold / :cnew - display older / newer quckfix state
  "  - location list is the same as quickfix, but local to window (we can
  "    have different location lists for different windows),
  "    lol / lnew for older / newer states
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
  Plug 'tpope/vim-unimpaired'
  " gcc - comment out line
  " gc<motion> - comment out lines defined by motion
  Plug 'tpope/vim-commentary'

  """ Quickfix improvements
  "
  " :QFdo - quickfix do - run a command over quckfix files, see also :LLdo for location list
  " :BufTypeDo, :BufMatchDo - run a command over buffers of specified type or
  "    buffers with name matching the pattern
  " Allows to populate vim's args from the quickfix, so we can:
  "  :Ggrep findme
  "  :Qargs | argdo %s/findme/replacement/gc | update
  " Plug 'nelstrom/vim-qargs'
  " :View command -> command result to split buffer, like :View ilist vim
  "    or :View map x
  " Alternative is to use 'redir' command:
  "   :redir >name_of_registers_file
  "   :registers
  "   :redir END
  "   :r name_of_registers_file
  " OR:
  "   :redir => m | silent registers | redir END | put=m
  " See
  "   :help redir
  " :Collect register-or-var command -> command result to register or var
  "  Collect('reg-or-var command') - similar as function
  " :GCollect - returns a list of lines for :g/pattern/, see also :GCCollect
  " :MyMaps - active maps into the new buffer
  " :Filter - like interactive :g/re/p - modifies the buffer! - leaves only matching lines in a buffer
  " z=, [I, g] - overlay for spell suggestions, search results, tag search results
  " Scall (script, function, arg) - call local function from script
  nnoremap q[I <plug>vimple_ident_search<bs>
  nnoremap q]I <plug>vimple_ident_search_forward
  Plug 'dahu/Vimple'
  " Having the quickfix list execute :EnMasse to edit the
  " list content and back-sync edits to source files
  Plug 'Wolfy87/vim-enmasse'
  " find and replace occurences in many buffers being aware of the context
  " :Swoop pattern - run for singe buffer
  " :Swoop! pattern - for all buffers
  " For all buffers it is convenient to :CloseSession and :BufOnly and then
  " for example, :args **/*.py to load all python files
  " and then we can review/edit results
  Plug 'pelodelfuego/vim-swoop'
  let g:swoopUseDefaultKeyMap = 0
  " TODO: check alternatives:
  "https://github.com/dyng/ctrlsf.vim
  "https://github.com/AndrewRadev/writable_search.vim
  "https://github.com/stefandtw/quickfix-reflector.vim

  " Highlight yanked text
  " see  http://stackoverflow.com/questions/26069278/hightlight-copied-area-on-vim
  " Lets user define their own operators.
  Plug 'kana/vim-operator-user'
  " Operator to do two or more operators.
  Plug 'thinca/vim-operator-sequence'
  " Highlight yanked text
  Plug 'osyo-manga/vim-operator-highlight'
  " let g:operator#highlight#clear_time=2.0
  noremap <expr> <Plug>(yank-highlight) operator#sequence#map("y", "\<Plug>(operator-highlight)")
  nmap yc <Plug>(yank-highlight)
  vmap yc <Plug>(yank-highlight)

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
  " Plug 'tpope/vim-scriptease'

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
  Plug 'tpope/vim-eunuch'
  " Add abbreviations for all combinations
  " :Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or}  {despe,sepa}rat{}
  " Replace combinations + smart case (Facility -> Building, facilities -> buildings)
  " :%Subvert/facilit{y,ies}/building{,s}/g
  " Coercion: crs - coerce to snake case, crm - mixed case, crc - camel, cru - upper fooBar (crs)-> foo_bar
  " See also: http://www.reddit.com/r/vim/comments/1weenn/oh_thats_why_abolish_is_useful_subvert/
  Plug 'tpope/vim-abolish'
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
  " Similar: https://github.com/tommcdo/vim-lion
  "          https://github.com/junegunn/vim-easy-align
  Plug 'godlygeek/tabular'
  " Gundo.vim is Vim plugin to visualize your Vim undo tree.
  Plug 'sjl/gundo.vim'
  " :Multichange to enter multichange mode (cw will affect the whole file)
  Plug 'AndrewRadev/multichange.vim'
  " disable mapping entirely
  let g:multichange_mapping = ''
  " gS / gJ to split / join multiline / single lines forms of code
  Plug 'AndrewRadev/splitjoin.vim'
  " always highlight matching html tags
  Plug 'Valloric/MatchTagAlways'

  """""" Programming / tags / autocomplete
  " Syntax checker
  Plug 'scrooloose/syntastic'
  " Syntastic
  " PHP - PHPCS
  " set default standard for phpcs: sudo phpcs --config-set default_standard PSR2
  " it is also possible to configure options for each checker, see
  " syntastic helt - "syntastic-config-makeprg"
  let g:syntastic_check_on_open=0
  let g:syntastic_css_checkers = ['csslint']
  " Python - pip install flake8 (pyflakes + pep8)
  "          pip install pep257 - docstring conventions

  " fetching can take a long time causing the timeout
  " to manually install it
  "  git clone --recursive https://github.com/Valloric/YouCompleteMe.git
  Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
  Plug 'UltiSnips'
  " http://0x3f.org/blog/make-youcompleteme-ultisnips-compatible/
  " let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
  " let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
  " let g:SuperTabDefaultCompletionType = '<C-Tab>'
  let g:ycm_key_list_select_completion = []
  let g:ycm_key_list_previous_completion = []
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  "let g:UltiSnipsExpandTrigger="<c-tab>"
  "let g:UltiSnipsListSnippets="<c-s-tab>"
  "let g:UltiSnipsJumpForwardTrigger="<c-tab>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-s-tab>"

  Plug 'honza/vim-snippets'
  Plug 'airblade/vim-rooter'
  " https://github.com/majutsushi/tagbar/wiki
  " http://majutsushi.github.com/tagbar/ :TagbarToggle
  Plug 'majutsushi/tagbar'

  " disables certain vim features to speedup large file editing
  " g:LargeFile (by default, its 100) - 100Mb
  Plug 'vim-scripts/LargeFile'
  " drawing in vim
  " \di - start \ds - stop
  " left-right-up-down - draw and move; with shift - just move
  " > < ^ v - draw an arrow; pgdb / end / pgup / home - move by diagonal
  " \> \< \^ \v - draw a fat arrow;
  " visual block: \a - arrow; \b - box; \e - ellipse; \f - fill; \h - canvas; \l - line;
  "               \s - add spaces to canvas
  " leftmouse - select visual block; s-leftmouse - drag and draw with current brush (register)
  " \ra ... \rz - replace text with given brush (register); \pa ... - like \ra.., blanks are transparent
  Plug 'vim-scripts/DrawIt'

  " Highlight patterns when do :s/... in cmd window (Ctrl-f in cmd mode)
  " also has own cmd line :OverCommandLine
  Plug 'osyo-manga/vim-over'

  """""" Db
  " see https://mutelight.org/dbext-the-last-sql-client-youll-ever-need
  " <Leader>sel - execute line, slt - list tables, sdt - describe table under
  " cursor, se - execute multiline (up to ;), st - select * from table,
  " sT - select from table, prompt for limit, stw - prompts for where,
  " sta - prompts for table name, slc - copy column names
  " Results buffer: R - rerun command; q - close.
  " Connection - :DBPromptForBufferParameters or sbp
  " Define profiles (can be done per-project in .vimrc.local):
  "  let g:dbext_default_profile_mySqlProject = 'type=MYSQL:user=root:passwd=:dbname=mydb'
  "  let g:dbext_default_profile_mySqlProjectTest = 'type=MYSQL:user=root:passwd=:dbname=mydb_test'
  " Set db param (name, user, pw, etc) - :DBSetOption dbname=mydb
  " visual se - execute
  Plug 'vim-scripts/dbext.vim'

  """""" Markdown
  Plug 'tpope/vim-markdown'
  " Markup files preview: <Leader>P
  Plug 'greyblake/vim-preview'
  let g:PreviewBrowsers='google-chrome'

  Plug 'suan/vim-instant-markdown'

  """""" PHP
  " php completion - it should be copied to autoload/phpcomplete.vim
  Plug 'shawncplus/phpcomplete.vim'
  " php 5.3 syntax
  Plug 'StanAngeloff/php.vim'
  Plug '2072/PHP-Indenting-for-VIm'

  """""" Javascript
  Plug 'pangloss/vim-javascript'
  let g:javascript_conceal = 0
  Plug 'othree/javascript-libraries-syntax.vim'
  let g:used_javascript_libs = 'jquery,underscore,angularjs'
  " ejs templates syntax highlight
  Plug 'briancollins/vim-jst'
  " better json highlighting
  Plug 'elzr/vim-json'

  """""" Python
  " Add the virtualenv's site-packages to vim path
  if has("python")
python << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
  endif

  " Install: cd ~/.vim/bundle/ropevim
  "          python setup.py install
  " See: https://github.com/python-rope/ropevim
  Plug 'python-rope/ropevim'
  "Plug 'klen/python-mode'
  " Correct python code indenting
  Plug 'hynek/vim-python-pep8-indent'

  """""" Documentation
  " php documenter
  Plug 'mikehaertl/pdv-standalone'
  " phpDocumenter
  let g:pdv_cfg_Package = "app"
  let g:pdv_cfg_Version = ""
  let g:pdv_cfg_Author = "Boris Serebrov"
  let g:pdv_cfg_Copyright = ""
  let g:pdv_cfg_License = ""
  Plug 'heavenshell/vim-jsdoc'
  "JSDoc
  let g:jsdoc_default_mapping = 0
  augroup DocMap
    autocmd!

    autocmd FileType php inoremap <Leader>pd <ESC>:call PhpDocSingle()<CR>i
    autocmd FileType php nnoremap <Leader>pd :call PhpDocSingle()<CR>
    autocmd FileType php vnoremap <Leader>pd :call PhpDocRange()<CR>

    autocmd FileType javascript nnoremap <Leader>pd :JsDoc<CR>

  augroup END
  """""" Go
  Plug 'fatih/vim-go'

  """""" Wakatime: https://wakatime.com
  Plug 'wakatime/vim-wakatime'

  Plug '~/.vim/bundle/potion'

  Plug 'joonty/vdebug'
  " Automatic ctags re-generator
  " similar: https://github.com/xolox/vim-easytags
  Plug 'joonty/vim-taggatron'
  Plug 'TyeMcQueen/vim-merge-windows'

  call plug#end()

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
      set guifont=Droid\ Sans\ Mono\ 11
      " set guifont=Ubuntu\ Mono\ 13
      " set guifont=Monospace\ 11
  endif
  " }}}

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

" }}}

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
      autocmd InsertLeave,CursorHold,CursorHoldI * call DoAutosave()
      autocmd FocusLost,WinLeave   * call DoAutosave()
    augroup END
  endif
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

  set relativenumber         " both relative and number (for current line)
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
  "
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
    autocmd FileType markdown :set nosmartindent

    "" use Leader-r to refresh (default is Ctrl-L which is used to jump
    "" to the left window)
    autocmd FileType netrw nnoremap <buffer> <Leader>r <Plug>NetrwRefresh
  augroup END

  " run nvim as below to get gui colors in terminal, works in gnome-termial
  " and konsole
  " NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim
  " See: https://github.com/neovim/neovim/pull/2198
  function! SetupColorscheme()
    set background=dark
    let g:solarized_contrast="high"    "default value is normal
    let g:solarized_diffmode="high"    "default value is normal
    try
        colorscheme solarized
    catch /^Vim\%((\a\+)\)\=:E185/
        echo "Solarized theme not found. Run :PluginInstall"
    endtry
  endfunction
  augroup NvimColors
    autocmd!
    autocmd VimEnter * call SetupColorscheme()
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

  " Repeat change on word
  " Set cursor over a word, <leader>c - change it,
  " now '.' will repeat the change on the next word, n - skip the next word
  nnoremap <leader>c *Ncgn

  " Don't copy on change operations
  noremap c "_c
  noremap cc "_cc
  noremap C "_C

  " Note: to replace something with yanked text it's easy to use
  " a change operation and then <C-R>0 to insert register '0' content
  " in insert mode, like cw<C-R>0 - replace a word with yanked text

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
  nnoremap <Leader><Leader> %

  " Go to start / end of line - easier way
  noremap H ^
  noremap L $
  vnoremap L g_

  " ,vv to re-read .vimrc
  nnoremap <Leader>vv :call Preserve("source ".$MYVIMRC)<CR>
  " ,vc to edit .vimrc
  "nnoremap <leader>vc :tabedit $MYVIMRC<CR>
  nnoremap <leader>vc :tabedit $HOME/.vim/.vimrc<CR>

  " Use CTRL-N to remove search highlight
  noremap <C-N> :noh \| call clearmatches()<CR>
  vnoremap <C-N> <C-C>:noh \| call clearmatches()<CR>gv
  " CTRL-N in insert mode is a completion!!!
  " inoremap <C-N> <C-O>:noh<CR>

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

  " <Leader>a to toggle current fold (more convenient then za)
  nnoremap <Leader>a za

  " http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
  " remove trailing spaces
  nnoremap _$ :call preserve("%s/\\s\\+$//e")<cr>
  " autoformat file
  nnoremap _= :call preserve("normal gg=g")<cr>

  " Insert current file's folder
  cnoremap <Leader><Leader>fn <C-r>=expand('%')<CR>
  cnoremap <Leader><Leader>f <C-r>=expand('%:p:h')<CR>

  " will expand %% to current file path
  "cabbr <expr> %% expand('%:p:h')
  cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>

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

  nnoremap gl :call ToggleRelativeAbsoluteNumber()<CR>
  function! ToggleRelativeAbsoluteNumber()
    if &relativenumber
      set norelativenumber
    else
      set relativenumber
    endif
  endfunction

  " plugins/next-object.vim
  " Motion for "next/last object"
  " Currently works for (, [, {, and their shortcuts b, r, B.
  " Some examples (C marks cursor positions, V means visually selected):
  "
  " din'  -> delete in next single quotes                foo = bar('spam')
  "                                                      C
  "                                                      foo = bar('')
  "                                                                C
  "
  " canb  -> change around next parens                   foo = bar('spam')
  "                                                      C
  "                                                      foo = bar
  "                                                               C
  "
  " vin"  -> select inside next double quotes            print "hello ", name
  "                                                       C
  "                                                      print "hello ", name
  "                                                             VVVVVV
  onoremap an :<c-u>call NextTextObject('a', '/')<cr>
  xnoremap an :<c-u>call NextTextObject('a', '/')<cr>
  onoremap in :<c-u>call NextTextObject('i', '/')<cr>
  xnoremap in :<c-u>call NextTextObject('i', '/')<cr>

  onoremap al :<c-u>call NextTextObject('a', '?')<cr>
  xnoremap al :<c-u>call NextTextObject('a', '?')<cr>
  onoremap il :<c-u>call NextTextObject('i', '?')<cr>
  xnoremap il :<c-u>call NextTextObject('i', '?')<cr>

  " inside next ( text object (just a simple example of omap)
  " note: C-U removes the '<,'> when mapping is used in visual mode
  " onoremap in( :<c-u>normal! f(vi(<cr>
  " " inside last (
  " onoremap il( :<c-u>normal! F)vi(<cr>
  " " around next (
  " onoremap an( :<c-u>normal! f(va(<cr>
  " " around last (
  " onoremap al( :<c-u>normal! F)va(<cr>
" }}}

" Buffers navigation {{{
    " list buffers and start completion
    nnoremap <Leader>b :buffer <C-z>
    nnoremap <Leader>B :sbuffer <C-z>

    " list buffers with ls and start completion
    nnoremap gb :ls<CR>:buffer<Space>
    nnoremap gB :ls<CR>:sbuffer<Space>
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
    "with -S it doesn't work in virtual env
    "let last_cmd = '!python -S ~/pydbgp/bin/pydbgp -d localhost:9000 -k vim_debug ' . str_args
    let last_cmd = '!python ~/pydbgp/bin/pydbgp -d localhost:9000 -k vim_debug ' . str_args
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
    " Use with :find - it will search subdirectories
    set path=.,**
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

  let g:netrw_altfile = 1

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

  " Actually I only need 'pdiff' script from there which converts
  " between git diff format and vim diff
  " Plugin 'TyeMcQueen/vim-merge-windows'
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
  "These commands allow to set different diff algorithms
  "So when vim is in diff / conflict resolution mode
  "the diff can be switched with
  "  :PDiffOnPatience
  "to use patience diff algorithm
  command! PDiffOnMyers call PDiffOn('myers')
  command! PDiffOnPatience call PDiffOn('patience')
  command! PDiffOnMinimal call PDiffOn('minimal')
  command! PDiffOnHistogram call PDiffOn('histogram')
  command! PDiffOff call PDiffOff()

  set diffopt=filler,iwhite

  " Highlight VCS conflict markers
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

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
" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}

" }}}
" Pulse Line {{{

function! s:Pulse() " {{{
    redir => old_hi
        silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor
    for i in range(end, start, -1 * width)
        execute "hi CursorLine ctermbg=" . (color + i)
        redraw
        sleep 6m
    endfor

    execute 'hi ' . old_hi
endfunction " }}}
command! -nargs=0 Pulse call s:Pulse()

" }}}

" Search {{{

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

  " Search for keyword under cursor and start result selection mode
  " (this is :help include-search)
  " Note: result is similar to :g/C-RC-W (it uses 'p' - print command by
  " default)
  "nnoremap [I [I:
  " Search in the file, display a list of results
  nnoremap <Leader>I :ilist /

  " Search the last search (@/ - '/' register content, last search text)
  " using vimgrep and show in quickfix
  nnoremap <Leader>z :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ag Motions
" From https://bitbucket.org/sjl/dotfiles (AckMotions)

" Motions to Ag for things.  Works with pretty much everything, including:
"
"   w, W, e, E, b, B, t*, f*, i*, a*, and custom text objects
"
" Awesome.
"
" Note: If the text covered by a motion contains a newline it won't work.  Ag
" searches line-by-line.
nnoremap <silent> g/ :set opfunc=<SID>AgMotion<CR>g@
xnoremap <silent> g/ :<C-U>call <SID>AgMotion(visualmode())<CR>

" search word under cursor
nnoremap <Leader>w :Ag! '\b<c-r><c-w>\b'<cr>
" search for visual selection
xnoremap <silent> <Leader>w :call <SID>AgMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
    if a:type ==# 'v'
        silent execute "normal! `<" . a:type . "`>y"
    elseif a:type ==# 'char'
        silent execute "normal! `[v`]y"
    endif
endfunction

function! s:AgMotion(type) abort
    let reg_save = @@

    call s:CopyMotionForType(a:type)

    execute "normal! :Ag! --literal " . shellescape(@@) . "\<cr>"

    let @@ = reg_save
endfunction

" See https://gist.github.com/romainl/3c7ee68125f822ec550c
"
" This is an updated, more powerful, version of the function discussed here:
" http://www.reddit.com/r/vim/comments/1rzvsm/do_any_of_you_redirect_results_of_i_to_the/
" that shows ]I, [I, ]D, [D, :ilist and :dlist results in the quickfix window, even spanning multiple files.

function! List(command, selection, start_at_cursor, ...)
    " derive the commands used below from the first argument
    let excmd   = a:command . "list"
    let normcmd = toupper(a:command)

    if a:selection
        if len(a:1) > 0
            let search_pattern = a:1
        else
            let old_reg = @v
            normal! gv"vy
            let search_pattern = substitute(escape(@v, '\/.*$^~[]'), '\\n', '\\n', 'g')
            let @v = old_reg
        endif
        redir => output
        silent! execute (a:start_at_cursor ? '+,$' : '') . excmd . ' /' . search_pattern
        redir END
    else
        redir => output
        silent! execute 'normal! ' . (a:start_at_cursor ? ']' : '[') . normcmd
        redir END
    endif

    " clean up the output
    let lines = split(output, '\n')

    " bail out on errors
    if lines[0] =~ '^Error detected'
        echomsg 'Could not find "' . (a:selection ? search_pattern : expand("<cword>")) . '".'
        return
    endif

    " our results may span multiple files so we need to build a relatively
    " complex list based on file names
    let filename   = ""
    let qf_entries = []
    for line in lines
        if line =~ '^\S'
            let filename = line
        else
            call add(qf_entries, {"filename" : filename, "lnum" : split(line)[1], "text" : join(split(line)[2:-1])})
        endif
    endfor

    " build the quickfix list from our results
    call setqflist(qf_entries)

    " open the quickfix window if there is something to show
    cwindow
endfunction

nnoremap <silent> [I :call List("i", 0, 0)<CR>
nnoremap <silent> ]I :call List("i", 0, 1)<CR>
xnoremap <silent> [I :<C-u>call List("i", 1, 0)<CR>
xnoremap <silent> ]I :<C-u>call List("i", 1, 1)<CR>

command! -nargs=1 Ilist call List("i", 1, 0, <f-args>)

nnoremap <silent> [D :call List("d", 0, 0)<CR>
nnoremap <silent> ]D :call List("d", 0, 1)<CR>
xnoremap <silent> [D :<C-u>call List("d", 1, 0)<CR>
xnoremap <silent> ]D :<C-u>call List("d", 1, 1)<CR>

command! -nargs=1 Dlist call List("d", 1, 0, <f-args>)

" }}}

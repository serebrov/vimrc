" Plugins {{{
" Plug commands:
"  - PlugInstall [name ...] [#threads] 	Install plugins
"  - PlugUpdate [name ...] [#threads] 	Install or update plugins
"  - PlugClean[!] 	Remove unlisted plugins (bang version will clean without prompt)
"  - PlugUpgrade 	Upgrade vim-plug itself
"  - PlugStatus 	Check the status of plugins
"  - PlugDiff 	Examine changes from the previous update and the pending changes
"  - PlugSnapshot[!] [output path] 	Generate script for restoring the current snapshot of the plugins
"
" Updates:
" PlugUpdate to update plugins
" TSUpdate update treesitter parsers
" TSInstall to install treesitter parsers
" LspInstallInfo to see installed lsp servers.
" LspInstall to install more lsp servers.
"
if exists('g:vscode')
  source ~/.vim/.vimrc.vscode-neovim
else
  set nocompatible " explicitly get out of vi-compatible mode

  " Needed at least for nvim to correctly work with unicode
  " see https://github.com/neovim/neovim/issues/5683#issuecomment-420833679
  lang en_US.UTF-8

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
    " Close all folds initially:
    " set foldlevel=0
    " Open all folds initally:
    set foldlevel=999

    " Note: markdown can be formatted with :Prettier (for example,
    " to format the markdown table, select it and run :Prettier)

    " Original plugin has issue in newer vim/nvim
    " https://github.com/masukomi/vim-markdown-folding/issues/42
    " Plug 'masukomi/vim-markdown-folding'
    " Plug 'mikeboiko/vim-markdown-folding'

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
    " Cycle open and closed folds and nested folds - <CR> / <BS>
    " Use when the cursor is on the fold.
    Plug 'arecarn/vim-fold-cycle'

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

    " Note: related config is in .vimrc.ide, folding with treesitter.

  " End Folding

  " Vim sessions with Obsession
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

  Plug 'Shougo/neomru.vim'
  let g:neomru#file_mru_path = $HOME . '/.vim/tmp/cache/neomru/file'
  let g:neomru#directory_mru_path = $HOME . '/.vim/tmp/cache/neomru/directory'

  source ~/.vim/.vimrc.fzf
  source ~/.vim/.vimrc.git-and-diff
  source ~/.vim/.vimrc.ide
  " source ~/.vim/.vimrc.ide.coc
  source ~/.vim/.vimrc.tools
  source ~/.vim/.vimrc.text
  source ~/.vim/.vimrc.search
  source ~/.vim/.vimrc.db
  source ~/.vim/.vimrc.colors

  " Github copilot
  " :Copilot setup
  " :Copilot status
  " :Copilot panel
  Plug 'github/copilot.vim'
  imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true

  """""" Motions / normal mode commands
  " CamelCase and under_score motions: ,w ,b ,e and i,w i,b i,e
  let g:camelcasemotion_key = ','
  " Note: we have an integration with vim-smartword below, so
  " CamelCaseMotion is used by default for w, b, e and ge.
  " To operate on whole words, use W, B, E and gE.
  Plug 'bkad/CamelCaseMotion'

  " call camelcasemotion#CreateMotionMappings(',')
  " Default w motion:
  " <a href="http://www.vim.org/">www.vim.org</a>
  "  # #   # #   #  #  ##  ##  #  #  ##  ##  # #
  " Smart word (skip non-letters between words):
  " <a href="http://www.vim.org/">www.vim.org</a>
  "  # #     #      #   #   #     #   #   #    #
  " Plug 'kana/vim-smartword'

  " Live preview for commands, like `:Preview norm`, etc.
  " https://github.com/smjonas/live-command.nvim
  " We initialize it in the lua code (below):
  " require('live-command').setup()
  Plug 'smjonas/live-command.nvim'

  call plug#end()

  if has('nvim')
    " Note: this should be outside of plug#begin() / plug#end(),
    " otherwise errors are raised in the lua code.
    " The related configuration is in .vimrc.ide,
    " see nvim-lspconfig.

    " For lsp plugins in .vimrc.ide
    luafile ~/.vim/.vimrc.ide.lsp.lua
    " For Plug 'neovim/nvim-dap'
    " luafile ~/.vim/.vimrc.ide.dap.lua

    lua << EOF
    require('live-command').setup()
EOF

  endif

  " map <Plug>(smartword-basic-w) <Plug>CamelCaseMotion_w
  " map <Plug>(smartword-basic-b) <Plug>CamelCaseMotion_b
  " map <Plug>(smartword-basic-e) <Plug>CamelCaseMotion_e

" TODO: how to select ConfigBase in the following?
" ve only selects "Config" and vE selects "ConfigBase)"
" def create_app(app_config: ConfigBase) -> App:

"""""" Motions / normal mode commands: mappings
" Regular mappings for CamelCaseMotion integration do not work
" so we use the function and autocommand to enable them.
" function s:smartword_mappings() abort
"   " For Plug 'vim-smartword'
"   map w  <Plug>(smartword-w)
"   map b  <Plug>(smartword-b)
"   map e  <Plug>(smartword-e)
"   map ge  <Plug>(smartword-ge)

"   " For Plug 'CamelCaseMotion'
"   " This combines two plugins, vim-smartword will skip  non-letters between
"   " words, CamelCaseMotion will use CamelCase as word boundaries.
"   " (remove these mappings and uncomment let g:camelcasemotion_key = ','
"   " above to use special ,w ,b ,e motions)
"   map <Plug>(smartword-basic-w)  <Plug>CamelCaseMotion_w
"   map <Plug>(smartword-basic-b)  <Plug>CamelCaseMotion_b
"   map <Plug>(smartword-basic-e)  <Plug>CamelCaseMotion_e
"   map <Plug>(smartword-basic-ge)  <Plug>CamelCaseMotion_ge
" endfunction
" augroup SmartWordCustom
"   autocmd!
"   autocmd VimEnter * call <SID>smartword_mappings()
" augroup END

" see .vimrc.colors
call SetupColorscheme()

source ~/.vim/.vimrc.base.settings
source ~/.vim/.vimrc.base.mappings
source ~/.vim/.vimrc.base.autocmd

endif " if exists('g:vscode')

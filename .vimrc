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

  " Github copilot
  " :Copilot setup
  " :Copilot status
  " :Copilot panel
  Plug 'github/copilot.vim'
  imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
  let g:copilot_no_tab_map = v:true

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

  if has('nvim')
    " Note: this should be outside of plug#begin() / plug#end(),
    " otherwise errors are raised in the lua code.
    " The related configuration is in .vimrc.ide,
    " see nvim-lspconfig.

    " For Plug 'neovim/nvim-lspconfig'
    luafile ~/.vim/.vimrc.ide.lsp.lua
    " For Plug 'neovim/nvim-dap'
    luafile ~/.vim/.vimrc.ide.dap.lua

  endif

" see .vimrc.colors
call SetupColorscheme()

source ~/.vim/.vimrc.base.settings
source ~/.vim/.vimrc.base.mappings
source ~/.vim/.vimrc.base.autocmd

endif " if exists('g:vscode')

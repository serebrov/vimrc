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
if exists('g:vscode')
  source ~/.vim/.vimrc.vscode-neovim
else
  set nocompatible " explicitly get out of vi-compatible mode
  " filetype off

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
    " Open all folds:
    set foldlevel=0
    " set foldlevel=999
    "
    " Note: coc.nvim also has folding support, but it doesn't work for python
    " and vue at the moment.
    " To use coc, do:
    " set foldmethod=manual
    " :Fold

    " Generic folding mechanism and motion based on indentation.
    " Fold anything that is structured into indented blocks.
    " Quickly navigate between blocks.
    " Plug 'pseewald/vim-anyfold'
    " set foldmethod=syntax
    " let anyfold_activate=1  " Note: it conflicts with Magit buffer
    " let anyfold_fold_comments=1
    " autocmd Filetype php,css,vue,vim :AnyFoldActivate

    " From 'pangloss/vim-javascript' readme
    " augroup javascript_folding
    "     au!
    "     au FileType javascript setlocal foldmethod=syntax
    "     au FileType typescript setlocal foldmethod=syntax
    " augroup END

    " python folding
    " let g:SimpylFold_docstring_preview = 1
    " Plug 'tmhedberg/SimpylFold'

    " Note: markdown can be formatted with :Prettier (for example,
    " to format the markdown table, select it and run :Prettier)

    Plug 'masukomi/vim-markdown-folding'

    " let g:coiled_snake_set_foldtext = 0
    " Plug 'kalekundert/vim-coiled-snake'
    " Recommended to make folding faster.
    " Plug 'Konfekt/FastFold'

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

  if has('nvim')
    " Note: this should be outside of plug#begin() / plug#end(),
    " otherwise errors are raised in the lua code.
    " The related configuration is in .vimrc.ide,
    " see nvim-lspconfig.

    " For Plug 'neovim/nvim-lspconfig'
    luafile ~/.vim/.vimrc.ide.lua
    luafile ~/.vim/.vimrc.dap.lua

  endif

" see .vimrc.colors
call SetupColorscheme()

source ~/.vim/.vimrc.base.settings
source ~/.vim/.vimrc.base.mappings
source ~/.vim/.vimrc.base.autocmd

endif " if exists('g:vscode')

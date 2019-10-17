#!/usr/bin/env bash

if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
  pushd ~/.vim
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  popd
fi

# for vim
ln -s ~/.vim/.vimrc ~/.vimrc

# for neovim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/.vimrc ~/.config/nvim/init.vim

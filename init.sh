#!/usr/bin/env bash

if [[ ! -f ~/vim/autoload/plug.vim ]]; then
  pushd ~/vim
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  popd
fi

# for neovim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vim/.vimrc ~/.vim/init.vim

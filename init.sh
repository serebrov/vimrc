#!/usr/bin/env bash

if [[ ! -f ~/vim/autoload/plug.vim ]]; then
  pushd ~/vim
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  popd
fi

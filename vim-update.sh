#!/usr/bin/env bash

cd ~/vim
# hg clone https://code.google.com/p/vim/
hg pull
hg update

./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74

sudo  checkinstall -y

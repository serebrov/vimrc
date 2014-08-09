#!/usr/bin/env bash

# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source

if [[ -d ~/vim ]]; then
  cd ~/vim
else
  sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
  sudo apt-get -y remove vim vim-runtime gvim
  sudo apt-get -y install checkinstall
  #mkdir ~/vim
  #cd ~/vim
  cd ~
  hg clone https://code.google.com/p/vim/
  cd ~/vim
fi
hg pull
hg update

./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74

sudo checkinstall -y

sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
sudo update-alternatives --set editor /usr/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
sudo update-alternatives --set vi /usr/bin/vim

# prevent auto-update
echo "vim hold" | sudo dpkg --set-selections
echo "vim-common hold" | sudo dpkg --set-selections
echo "vim-runtime hold" | sudo dpkg --set-selections

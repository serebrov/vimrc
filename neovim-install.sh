#!/usr/bin/env bash

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

sudo apt-get install libffi-dev
# pip2 install --user neovim
pip install --user neovim

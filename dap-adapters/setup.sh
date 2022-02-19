#!/usr/bin/env bash

# Python
if [[ ! -d venv-debugpy ]]; then
  mkdir venv-debugpy
  virtualenv -p python3 venv-debugpy
  venv-debugpy/bin/python -m pip install debugpy
fi

# https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Javascript
# Javascript - node
if [[ ! -d vscode-node-debug2 ]]; then
  git clone https://github.com/microsoft/vscode-node-debug2.git
fi
pushd ./vscode-node-debug2
git pull
npm install
npm run build
popd

# Javascript - Chrome
if [[ ! -d vscode-chrome-debug ]]; then
  git clone https://github.com/Microsoft/vscode-chrome-debug
fi
pushd ./vscode-chrome-debug
git pull
npm install
npm run build
popd

# Javascript - Firefox
if [[ ! -d vscode-firefox-debug ]]; then
  git clone https://github.com/firefox-devtools/vscode-firefox-debug.git
fi
pushd ./vscode-firefox-debug
git pull
npm install
npm run build
popd

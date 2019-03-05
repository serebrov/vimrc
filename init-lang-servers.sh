#!/usr/bin/env bash

# The list of servers: https://langserver.org/

# bash
# https://github.com/mads-hartmann/bash-language-server
npm i -g bash-language-server

# Dockerfile
# https://github.com/rcjsuen/dockerfile-language-server-nodejs
npm install -g dockerfile-language-server-nodejs

# Go
# https://github.com/sourcegraph/go-langserver
go get -u github.com/sourcegraph/go-langserver

# Rust
# https://github.com/rust-lang/rls
rustup update
rustup component add rls rust-analysis rust-src

# Python
# https://github.com/palantir/python-language-server
pip install --user python-language-server

# Javascript and Typescript
# https://github.com/sourcegraph/javascript-typescript-langserver
# docker run --publish 7080:7080 --publish 2633:2633 --rm --volume ~/.sourcegraph/config:/etc/sourcegraph --volume ~/.sourcegraph/data:/var/opt/sourcegraph sourcegraph/server:3.0.0
npm install -g javascript-typescript-langserver

# PHP
# https://github.com/felixfbecker/php-language-server
# sudo apt install composer
echo '{ "minimum-stability": "dev", "require": { } }' > composer.json
composer require felixfbecker/language-server
composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs

#!/bin/bash

mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall

#!/bin/bash

mkdir ~/.vim/backup
mkdir ~/.vim/swap
mkdir ~/.vim/undo
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

#!/bin/bash

# backup files
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi 
if [ -e ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi

# cp all files to home directory
cp .vimrc ~/
cp -r .vim ~/ 

# clone vbundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# installing plugins
vim +PluginInstall +qall

# UltiSnips
mkdir ~/.vim/bundle/vim-snippets/my-snippets
cp -r .vim/settings/UltiSnips/all.snippets ~/.vim/bundle/vim-snippets/my-snippets

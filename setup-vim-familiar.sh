#!/bin/bash

# set -o xtrace
set -e

# Pull and setup TPope's vim-pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle || ( echo "Could not create dirs\n" && \
	exit 1 )
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim 

cp -f ~/.vimrc ~/.vimrc.BAK
echo "\" Update runtimepaths" >> ~/.vimrc
echo "execute pathogen#infect()" >> ~/.vimrc

# Place the familiar plugin 
mkdir -p ~/.vim/bundle/familiar/plugin || ( echo "Could not create dirs\n" && \
	exit 1 )
cp -f ./plugin/familiar.vim ~/.vim/bundle/familiar/plugin/

# Pull and setup TPope's vim-surround
mkdir -p ~/.vim/bundle/vim-surround/plugin || ( echo "Could not create dirs\n" && \
	exit 1 )
wget -q -O ~/.vim/bundle/vim-surround/plugin/surround.vim \
https://raw.githubusercontent.com/tpope/vim-surround/master/plugin/surround.vim

exit 0

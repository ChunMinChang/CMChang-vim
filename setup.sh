#!/bin/bash

# install the vim
sudo apt-get install vim

# Create a folder
sudo mkdir ~/.vim/templates

# Pathogen
sudo mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# vim-sensible
cd ~/.vim/bundle && \
  git clone git://github.com/tpope/vim-sensible.git


#!/bin/bash

USER_HOME=$(eval echo ~${USER})
CMC_VIM=CMChang-vim
CMC_VIM_DIR=$USER_HOME/$CMC_VIM


echo "Go home directory: $USER_HOME"
# $HOME could be changed by user
cd $USER_HOME

echo "Installing vim...."
# Install the vim
sudo apt-get install vim

echo "Installing NeoBundle...."
# Install NeoBundle
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

echo "Cloning CMChang-vim...."
# Clone my vim folder
git clone https://github.com/ChunMinChang/CMChang-vim.git

# symlink to vim and vimrc
#ln -s cmc-vim $(HOME)

#!/bin/bash

USER_HOME=$(eval echo ~${USER})
echo "Go home directory: $USER_HOME"
# $HOME could be changed by user
cd $USER_HOME

# Install the vim
sudo apt-get install vim

# Install NeoBundle
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# Clone my vim folder
#git clone https://github.com/ChunMinChang/CMChang-vim.git

# symlink to vim and vimrc
cd CMChang-vim
#ln -s cmc-vim $(HOME)

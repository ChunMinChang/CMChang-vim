#!/bin/bash

USER_HOME=$(eval echo ~${USER})
CMC_VIM_GIT=CMChang-vim
CMC_VIM=$USER_HOME/$CMC_VIM_GIT/cmc-vim
CMC_VIMRC=$USER_HOME/$CMC_VIM_GIT/vimrc

ORI_VIM=$USER_HOME/.vim
ORI_VIMRC=$USER_HOME/.vimrc

echo "Go home directory: $USER_HOME"
# $HOME could be changed by user
cd $USER_HOME

echo "Installing vim...."
# Install the vim
sudo apt-get install vim

echo "Installing NeoBundle...."
# Install NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

echo "Cloning CMChang-vim...."
# Clone my vim folder
git clone https://github.com/ChunMinChang/CMChang-vim.git

# symlink to .vimrc and .vim
ln -s $CMC_VIMRC $ORI_VIMRC
ln -s $CMC_VIM/templates $ORI_VIM/templates
ln -s $CMC_VIM/colors $ORI_VIM/colors

# open vim to install the plugins 
vim

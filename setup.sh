#!/bin/bash

USER_HOME=$(eval echo ~${USER})
CMC_VIM_GIT=CMChang-vim
CMC_VIM=$USER_HOME/$CMC_VIM_GIT/cmc-vim
CMC_VIMRC=$USER_HOME/$CMC_VIM_GIT/vimrc

ORI_VIM=$USER_HOME/.vim
ORI_VIMRC=$USER_HOME/.vimrc

BKP_VIM=$USER_HOME/vim-backup
BKP_VIMRC=$USER_HOME/vimrc-backup

echo "Go home directory: $USER_HOME"
# $HOME could be changed by user
cd $USER_HOME

# Check the git
echo "Installing git...."
if which git > /dev/null; then
    echo "git already exists!"
else
    echo "git not found! Installing it now..."
    # Install the git
    sudo apt-get install git
fi

# Check the vim
echo "Installing vim...."
if which vim > /dev/null; then
    echo "vim already exists!"
else
    echo "vim not found! Installing it now..."
    # Install the vim
    sudo apt-get install vim
fi

# Check the directory .vim
if [ -d $ORI_VIM  ]; then
  echo "Directory .vim exists! Now backup this folder to $BKP_VIM"
  mv $ORI_VIM $BKP_VIM
else
  echo "Directory .vim not found!"
fi

# Check the vim setting file .vimrc
if [ -f $ORI_VIMRC  ]; then
  echo "vim setting file .vimrc exists! Now backup this file to $BKP_VIMRC"
  mv $ORI_VIMRC $BKP_VIMRC
else
  echo "vim setting file .vimrc not found"
fi

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

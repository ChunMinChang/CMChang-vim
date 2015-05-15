#!/bin/bash

USER_HOME=$(eval echo ~${USER})
CMC_VIM_GIT=CMChang-vim
CMC_VIM=$USER_HOME/$CMC_VIM_GIT/cmc-vim
CMC_VIMRC=$USER_HOME/$CMC_VIM_GIT/vimrc

ORI_VIM=$USER_HOME/.vim
ORI_VIMRC=$USER_HOME/.vimrc

BKP_VIM=$USER_HOME/vim-backup
BKP_VIMRC=$USER_HOME/vimrc-backup

echo -e "\n  installing CMChang's Vim"
echo "============================================================================="
echo "Go home directory: $USER_HOME"
# $HOME could be changed by user
cd $USER_HOME

# Install the curl
echo -e "\n  Installing curl...."
echo "--------------------------------------------------"
sudo apt-get install curl -y

# Install the git
echo -e "\n  Installing git...."
echo "--------------------------------------------------"
sudo apt-get install git -y

# Install the vim
echo -e "\n  Installing vim...."
echo "--------------------------------------------------"
sudo apt-get install vim -y

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


# Install NeoBundle
echo -e "\n  Installing NeoBundle...."
echo "--------------------------------------------------"
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# Clone git repo
echo -e "\n  Cloning git repo of CMChang-vim...."
echo "--------------------------------------------------"
git clone https://github.com/ChunMinChang/CMChang-vim.git

# symlink to .vimrc and .vim
ln -s $CMC_VIMRC $ORI_VIMRC
ln -s $CMC_VIM/templates $ORI_VIM/templates
ln -s $CMC_VIM/colors $ORI_VIM/colors




# install required lib for vim-plugins
# 1) YouCompleteMe
echo -e "\n  Installing required lib for vim's plugins...."
echo "--------------------------------------------------"

echo -e "\n  Installing libclang(and llvm)....."
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

# install the clang

# update locate
#sudo updatedb
#libclang=$(locate libclang.so)
LLVM_PATH=/usr/lib/llvm-3.5/lib # Here we use clang-3.5
libclang=$LLVM_PATH/libclang.so
if [ -e "$libclang" ]; then
  echo "libclang.so already exists"
else
  echo "libclang.so doesn't exist! install it now!"
  #sudo apt-get install clang -y
  sudo apt-get install clang-3.5 lldb-3.5 -y

  # Make sure the libclang.so exist in llvm
  # reference: https://github.com/wklken/k-vim/issues/77
  if [ ! -e "$libclang" ]; then
    echo "libclang.so doesn't exist!"
    echo "Link $LLVM_PATH/libclang.so.1 to $LLVM_PATH/libclang.so"
    sudo ln -sf $LLVM_PATH/libclang.so.1 $LLVM_PATH/libclang.so
  elif [ -L "$libclang" ]; then
    echo "libclang.so have no link?"
    echo "Link $LLVM_PATH/libclang.so.1 to $LLVM_PATH/libclang.so"
    sudo unlink $LLVM_PATH/libclang.so
    sudo ln -sf $LLVM_PATH/libclang.so.1 $LLVM_PATH/libclang.so
  fi
fi

echo -e "\n  Installing cmake and python-dev....."
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sudo apt-get install build-essential cmake -y
sudo apt-get install python-dev -y




# open vim to install the plugins
vim

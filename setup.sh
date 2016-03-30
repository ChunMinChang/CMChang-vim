#!/bin/bash
source utils.sh

# Get the install command
installCMD=$(GetPackageInstallCommand)

# If the environment is mac, then download the mac vim
# and use macvim instead of vim to enable YouCompleteMe
if [ $ENV_OSX == $(GetOSEnvironment) ]; then
  echo -e "\n  Download MacVim"
  echo "--------------------------------------------------"
  $installCMD macvim
  alias vim='mvim -v'
  type -P mvim &>/dev/null && alias vim='mvim -v' || echo 'macvim install failed!' && exit 1
elif [ $ENV_LINUX == $(GetOSEnvironment) ]; then
  echo -e "\n  Download Vim"
  echo "--------------------------------------------------"
  echo $installCMD vim
else
  echo "No compatible settings here"
  exit 1
fi

# Symbollically link ./vimrc to ~/.vimrc
echo "Symbollically link to ~/.vimrc"
# backup to original vimrc if it exist
vimrcPath=$HOME/.vimrc
srcVimrcPath=$(pwd)/vimrc
# if ~/.vimrc exist
if [ -f $vimrcPath ]; then
  echo "~/.vimrc aleary exist"
  # and it's not symlink, then move it
  if [ ! -L $vimrcPath ]; then
    echo "backup the old vimrc"
    mv $vimrcPath $HOME/vimrc-old
  # and it's symlink, then just remove it
  else
    echo "remove the old symlink"
    rm $vimrcPath
  fi
fi
# link
ln -s $srcVimrcPath $vimrcPath

# Install vundle as plugin manager of vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# To switch to macvim, user must close the current console and open a new one
echo 'Please close the current console and open a new one to launch macvim'

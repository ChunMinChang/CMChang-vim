#!/bin/bash
source utils.sh

# open vim and install the plugins
echo -e "\n  Open vim and install plugins"
echo "--------------------------------------------------"
vim +PluginInstall +qall

# Get the install command
installCMD=$(GetPackageInstallCommand)

# Install the CMake
echo -e "\n  Install CMake"
echo "--------------------------------------------------"
if [ $ENV_OSX == $(GetOSEnvironment) ]; then
  $installCMD CMake
elif [ $ENV_LINUX == $(GetOSEnvironment) ]; then
  sudo $installCMD build-essential cmake
else
  echo "No compatible settings here"
  exit 1
fi

# Save the current path
curPath=$(pwd)

# Compiling YCM with semantic support for all language it provides
# cd ~/.vim/bundle/YouCompleteMe
# ./install.py --all

# Compiling YCM with semantic support for C-family languages:
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

cd $curPath

# CMChang-vim

| Options         | Description |
| --------------- | ----------- |
| last update     | 2015-06-04  |
| clang version   | 3.5         |


## Plugin Dependence
- YouCompleteMe 
  - clang : you can find the lastest version here: http://llvm.org/apt/
    - Remember to modify clang setting in setup.sh if your clang version is different from this

## How to install

If your OS is __Mac OS X__, then you must use _MacVim_ instead of _vim_ in OS X itself. You need to install _MacVim_ first:
```bash
brew install macvim
```
then add the following line to your bash file(e.g., ~/.bashrc or ~/.bash_profile)
```bash
alias vim='mvim -v'
```

Next, simply run the following command to install:

If your clang is 3.5:
```bash
$ wget https://raw.githubusercontent.com/ChunMinChang/CMChang-vim/master/setup.sh && bash setup.sh
```
Otherwise, you should download setup.sh and modify the clang version befroe installing
- download:
  ```bash
  $ wget https://raw.githubusercontent.com/ChunMinChang/CMChang-vim/master/setup.sh
  ```

- modify the clang version in setup.sh
  - you can find the lastest version here: http://llvm.org/apt/
  ```bash
  $ vi setup.sh
  ...
  ...
  # install the clang
  ...
  LLVM_PATH=/usr/lib/llvm-your_version_here/lib # To get clang-your_version_here
  ...
  ...
  sudo apt-get install clang-your_version_here lldb-your_version_here -y
  
  ```
  
- install
  ```bash
  $ setup.sh
  ```

### If your OS is Linux
After the script running, your vim will be opened and prompt you to install the plugins set by vimrc. You should enter **Y** to start the installing. However, the plugin **YouCompleteMe** will fail to be installed in the vim now. The vim will show the failed-installing message and ask you if this plugin should be removed or not. Please enter **N**. This problem can be fixed by following command after vim finish installing the other plugins:

```bash
$ cd ~/.vim/bundle/YouCompleteMe/ && sudo apt-get install build-essential cmake && sudo apt-get install python-dev && git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang --omnisharp-completer

or

$ cd ~/.vim/bundle/YouCompleteMe/
$ sudo apt-get install build-essential cmake
$ sudo apt-get install python-dev
$ git submodule update --init --recursive
$ ./install.sh --clang-completer --system-libclang --omnisharp-completer
```
Now, the installing is finished!

### If your OS is Mac OS X
After the script running, you might get this error:
```bash
Vim: Caught deadly signal ABRT
Vim: Finished.Abort trap: 6
```
You can find solution in [Valloric/YouCompleteMe/issues/8](https://github.com/Valloric/YouCompleteMe/issues/8).
Add the following line to your bash file(e.g., ~/.bashrc or ~/.bash_profile) might fix it:
```bash
alias vim='DYLD_FORCE_FLAT_NAMESPACE=1 mvim -v'
```


## FAQ
- vim-airline symbols are garbled? You need to set the powerline-fonts in your Terminal
  - Open "Terminal" >> Edit >> Profile Preferences >> General >> Font >> XXXX Powerline
  - http://askubuntu.com/questions/393005/having-problem-with-fonts-in-vim-airline

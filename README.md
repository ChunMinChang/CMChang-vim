# CMChang-vim

| Option         | Description |
| -------------- | ----------- |
| last update    | 2015-05-15  |
| clang version  | 3.5         |

## Plugin Dependence
- YouCompleteMe 
  - clang : you can find the lastest version here: http://llvm.org/apt/
    - Remember to modify

## How to use
Simply run the following command:

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
  LLVM_PATH=/usr/lib/llvm-3.5/lib # Here we use clang-your_version_here
  ...
  ...
  sudo apt-get install clang-your_version_here lldb-your_version_here -y
  
  ```
  
- install
  ```bash
  bash setup.sh
  ```

After the script running, your vim will be opened and prompt you to install the plugins set by vimrc. You should enter **Y** to start the installing. However, the plugin **YouCompleteMe** will fail to be installed in the vim now. The vim will show the failed-installing message and ask you if this plugin should be removed or not. Please enter **N**. This problem can be fixed by following command after vim finish installing the other plugins:

```bash
$ cd ~/.vim/bundle/YouCompleteMe/ && sudo apt-get install build-essential cmake && sudo apt-get install python-dev && git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang --omnisharp-completer
```
Now, the installing is finished!

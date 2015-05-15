# CMChang-vim

| Last update   | 2015-05-15 |
| clang version | 3.5        |

## How to use
Simply run the following command:

```bash
$ wget https://raw.githubusercontent.com/ChunMinChang/CMChang-vim/master/setup.sh && bash setup.sh
```

After the script running, your vim will be opened and prompt you to install the plugins set by vimrc. You should enter **Y** to start the installing. However, the plugin **YouCompleteMe** will fail to be installed in the vim now. The vim will show the fail-installing message to you and ask you if this plugin be removed or not. Please enter **N** to choose **NO**. This problem can be fixed by following command:

```bash
$ cd ~/.vim/bundle/YouCompleteMe/ && sudo apt-get install build-essential cmake && sudo apt-get install python-dev && git submodule update --init --recursive && ./install.sh --clang-completer --system-libclang --omnisharp-completer
```
Now, the installing is finished!

" Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 " vim-process
 NeoBundle 'Shougo/vimproc.vim', {
 \ 'build' : {
 \     'windows' : 'tools\\update-dll-mingw',
 \     'cygwin' : 'make -f make_cygwin.mak',
 \     'mac' : 'make -f make_mac.mak',
 \     'linux' : 'make',
 \     'unix' : 'gmake',
 \    },
 \ }

 " +---------------------+
 " | Syntax highlighting |
 " +---------------------+
 " colorscheme
 NeoBundle 'yearofmoo/Vim-Darkmate'

 " html5
 NeoBundle 'othree/html5.vim'

 " markdown
 NeoBundle 'plasticboy/vim-markdown'

 " @@@@@@@@@@@
 " @ Mozilla @
 " @@@@@@@@@@@
 NeoBundle 'mozfr/mozilla.vim'

 " +------------+
 " | File Lists |
 " +------------+
 " NERD Tree
 NeoBundle 'scrooloose/nerdtree'

 " NERD Tree Tabs
 NeoBundle 'jistr/vim-nerdtree-tabs'

 " +---------------------+
 " | File open searching |
 " +---------------------+
 " ctrlP
 NeoBundle 'kien/ctrlp.vim'

 " +------+
 " | Undo |
 " +------+
 " Undo Tree
 NeoBundle 'mbbill/undotree'

 " +---------+
 " | Airline |
 " +---------+
 NeoBundle 'bling/vim-airline'

 " +--------------+
 " | AutoComplete |
 " +--------------+
 " YouCompleteMe
 NeoBundle 'Valloric/YouCompleteMe', {
 \ 'build' : {
 \     'mac' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
 \     'unix' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
 \     'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
 \     'cygwin' : './install.sh --clang-completer --system-libclang --omnisharp-completer'
 \    }
 \ }
" Add or remove arguments to install.sh as necessary.
" Additional steps might be necessary for Windows, as always. ;)

" SnipMate
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'

" Auto Pairs
"
NeoBundle 'vim-scripts/Auto-Pairs'

" Surround
NeoBundle 'tpope/vim-surround'

" +-----------------+
" | syntax checking |
" +-----------------+
" syntastic
"NeoBundle 'scrooloose/syntastic'


 call neobundle#end()

 " Required:
 filetype plugin indent on

 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck



" =================================
" Vim Setting
" =================================
" Set colors
set t_Co=256

" color scheme
color jellybeans
"color darkmate

" size of a hard tabstop
set tabstop=2

" size of an 'indent'
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=2

" make 'tab' insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

" show line number
set number

" Searching is not case sensitive
set ignorecase

" Remove all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" =================================
" Plugins
" =================================

" NERDTree
" ---------------------------------
nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0
" open directory of current opened file
map <leader>r :NERDTreeFind<cr>

" make nerdtree look nice
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeWinSize=30
let NERDTreeIgnore=['\.pyc$']

" UndoTree
" ---------------------------------
nnoremap <F3> :UndotreeToggle<cr>

" YouCompleteMe
" ---------------------------------
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" Syntastic
" ---------------------------------
"let g:syntastic_cpp_check_header = 1

" Vim-Snipmate
" ---------------------------------
imap <C-J> <Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

" Airline
" ---------------------------------
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'

" =================================
" Shortcut
" =================================
"nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>
"nnoremap <F3> :UndotreeToggle<cr>
" Toggle the line number
nmap <C-A><C-A> :set invnumber<CR>
" Undo shortcut
nnoremap <F9> :u<CR>
" Read the code template
nmap <C-H><C-H> :r ~/.vim/templates/foo.html<CR>
" Toggle paste in insert mode
set pastetoggle=<F10>
" Delete all trailing whitespace.
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" Resize
" ---------------------------------
" resize vertical split window
nmap <C-Left> <C-W><
nmap <C-Right> <C-W>>
" resize horzontal split window
nmap <C-Up> <C-W>+
nmap <C-Down> <C-W>-

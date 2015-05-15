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

" ******************************************************
"   Plugins
" ******************************************************

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

" +----------------+
" | Basic Features |
" +----------------+
" backspace: Backspace through anything in insert mode.
" incsearch: Start searching before pressing enter.
" listchars: Makes :set list (visible whitespace) prettier.
" scrolloff: Always show at least one line above/below the cursor.
" runtime! macros/matchit.vim: Load the version of matchit.vim that ships with Vim.
NeoBundle 'tpope/vim-sensible'

" +---------------------+
" | Syntax highlighting |
" +---------------------+
" colorscheme
"NeoBundle 'yearofmoo/Vim-Darkmate'

" html5
NeoBundle 'othree/html5.vim'

" markdown
NeoBundle 'plasticboy/vim-markdown'

" @@@ Mozilla Gecko keyword @@@
NeoBundle 'mozfr/mozilla.vim'

" +------------+
" | text-align |
" +------------+
NeoBundle 'junegunn/vim-easy-align'

" +----------+
" | Comments |
" +----------+
" nerdcommenter: comment shortcut
NeoBundle 'scrooloose/nerdcommenter'

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

" +--------------+
" | AutoComplete |
" +--------------+
" SnipMate
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'

" Auto Pairs
NeoBundle 'vim-scripts/Auto-Pairs'

" Surround
NeoBundle 'tpope/vim-surround'

" YouCompleteMe
NeoBundle 'Valloric/YouCompleteMe', {
  \ 'build'   : {
    \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
    \ 'linux'   : './install.sh --clang-completer --system-libclang --omnisharp-completer',
    \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
    \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
    \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
  \ }
\ }

" +-----------------+
" | syntax checking |
" +-----------------+
" syntastic
"NeoBundle 'scrooloose/syntastic'
" >> YouCompleteMe already has this feature!


" +---------+
" | Airline |
" +---------+
NeoBundle 'bling/vim-airline'


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


" ******************************************************
"   Environment Settings
" ******************************************************

" =================================
" General
" =================================
" Set colors
set t_Co=256

" color scheme
color jellybeans
"color darkmate

" size of a hard tabstop
" tabstop = sp
set tabstop=2

" size of an 'indent'
" shiftwidth = sw
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
" softtabstop = sts
set softtabstop=2

" make 'tab' insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
" expandtab = et
set expandtab

" show line number
set number

" Searching is not case sensitive
set ignorecase

" Remove all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Mozilla C++ coding style
set ts=8 sts=2 et sw=2 tw=80

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

" Syntastic
" ---------------------------------
"let g:syntastic_cpp_check_header = 1

" Vim-Snipmate
" ---------------------------------
imap <C-E> <Plug>snipMateNextOrTrigger
smap <C-E> <Plug>snipMateNextOrTrigger

" vim-easy-align
" ---------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" YouCompleteMe
" ---------------------------------
"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:neobundle#install_process_timeout = 1500

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

" Resize split window of vim
" ---------------------------------
" resize vertical split window
nmap <C-Left> <C-W><
nmap <C-Right> <C-W>>
" resize horzontal split window
nmap <C-Up> <C-W>+
nmap <C-Down> <C-W>-

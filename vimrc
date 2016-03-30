" ******************************************************
"   Plugins
" ******************************************************
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ******************************************************
"   Environment Settings
" ******************************************************

" =================================
" Syntax and Colors
" =================================
" Highlight syntax
syntax enable
syntax on

" Set colors
"set t_Co=256

" color scheme
"set background=dark
"colorscheme hybrid
colorscheme jellybeans

" =================================
" General
" =================================
" Automatically detect the file's type
filetype on

" Automatically load the corresponding plugins by file's type
filetype plugin on

" Intelligent indent by different language
filetype indent on

" show line number
set number

" Set no-compatible with vi editor
set nocompatible

" Commands auto-complete
set wildmenu

" Highlight cursor row
set cursorline

" Highligh current column
set cursorcolumn

" Prompt asking what should do when commands conflict
set confirm

" Real-time search
set incsearch

" Highlight search
set hlsearch

" Searching is not case sensitive
set ignorecase

" Highlight syntax
syntax enable
syntax on

" Fold code by indent
"set foldmethod=indent
" Fold code by syntax
set foldmethod=syntax

" Open the folded code when vim start
set nofoldenable

" Allow to use backspace in insert-mode
" This is set by vim-sensible
" set backspace=2

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

" Mozilla C++ coding style
set ts=8 sts=2 et sw=2 tw=80

" Remove all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" =================================
" Plugins
" =================================

" YouCompleteMe
" ---------------------------------
" This link may be changed in newer YCM versions,
" so please check this link in YCM github first.
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Prevent to ask ..Found .../.ycm_extra_conf.py. Load?
" The default value is 1
let g:ycm_confirm_extra_conf = 0

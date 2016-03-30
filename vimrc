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

" +--------------+
" | AutoComplete |
" +--------------+
Plugin 'Valloric/YouCompleteMe'

" SnipMate
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'

" Auto Pairs
Plugin 'vim-scripts/Auto-Pairs'

" Surround
"Plugin 'tpope/vim-surround'

" +---------------------+
" | Syntax Highlighting |
" +---------------------+
" colorscheme
"Plugin 'yearofmoo/Vim-Darkmate'

" html5
Plugin 'othree/html5.vim'

" markdown
Plugin 'plasticboy/vim-markdown'

" ***************************
" *  Mozilla Gecko keyword  *
" ***************************
Plugin 'mozfr/mozilla.vim'

" +----------------+
" | Basic Features |
" +----------------+
" backspace: Backspace through anything in insert mode.
" incsearch: Start searching before pressing enter.
" listchars: Makes :set list (visible whitespace) prettier.
" scrolloff: Always show at least one line above/below the cursor.
" runtime! macros/matchit.vim: Load the version of matchit.vim that ships with Vim.
Plugin 'tpope/vim-sensible'

" +-------------+
" | Git Wrapper |
" +-------------+
" git status > :Gstatus
" see https://github.com/tpope/vim-fugitive
"Plugin 'tpope/vim-fugitive'

" +--------+
" | Indent |
" +--------+
Plugin 'nathanaelkane/vim-indent-guides'

" +------------+
" | Text-align |
" +------------+
"Plugin 'junegunn/vim-easy-align'

" +----------+
" | Comments |
" +----------+
" nerdcommenter: comment shortcut
Plugin 'scrooloose/nerdcommenter'

" +------------+
" | File Lists |
" +------------+
" NERD Tree
Plugin 'scrooloose/nerdtree'

" NERD Tree Tabs
Plugin 'jistr/vim-nerdtree-tabs'

" +---------------------+
" | File Open Searching |
" +---------------------+
" ctrlP
Plugin 'ctrlpvim/ctrlp.vim'

" +------+
" | Undo |
" +------+
" Undo Tree
Plugin 'mbbill/undotree'

" +------------------------+
" | source code navigation |
" +------------------------+
" Quickly switch files between .h and .c/.cpp
Plugin 'vim-scripts/a.vim'

" Tagbar(need ctags)
"Plugin 'majutsushi/tagbar'

" Cscope(need cscope)
"Plugin 'vim-scripts/cscope.vim'

" +---------+
" | Airline |
" +---------+
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'

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

" a.vim
" ---------------------------------
" switch between *.cpp and *.h
nmap <Leader>ch :A<CR>
" Show *.cpp or *.h in sub-window
nmap <Leader>sch :AS<CR>

" Indent-guides
" ---------------------------------
" Enable it once vim start
"let g:indent_guides_enable_on_vim_startup=1
" Show indent-guide from nested level #
let g:indent_guides_start_level=2
" indent-guide width
let g:indent_guides_guide_size=1
" Toggle indent-guides
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" NERDTree
" ---------------------------------
" t: Open the selected file in a new tab
" i: Open the selected file in a horizontal split window
" s: Open the selected file in a vertical split window
" I: Toggle hidden files
" m: Show the NERD Tree menu
" R: Refresh the tree, useful if files change outside of Vim
" ?: Toggle NERD Tree's quick help

function! NTFinderP()
  "" Check if NERDTree is open
  if exists("t:NERDTreeBufName")
    let s:ntree = bufwinnr(t:NERDTreeBufName)
  else
    let s:ntree = -1
  endif
  if (s:ntree != -1)
    "" If NERDTree is open, close it.
    :NERDTreeClose
  else
    "" Try to open a :Rtree for the rails project
    if exists(":Rtree")
      "" Open Rtree (using rails plugin, it opens in project dir)
      :Rtree
    else
      "" Open NERDTree in the file path
      :NERDTreeFind
    endif
  endif
endfunction

"" Toggles NERDTree
map <silent> <F2> :call NTFinderP()<CR>
"nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>
"autocmd BufEnter * lcd %:p:h
" open directory of current opened file
"map <leader>r :NERDTreeFind<cr>
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0

" make nerdtree look nice
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeWinSize=30
let NERDTreeIgnore=['\.pyc$']

" UndoTree
" ---------------------------------
nnoremap <F3> :UndotreeToggle<cr>

" Vim-Snipmate
" ---------------------------------
"imap <C-E> <Plug>snipMateNextOrTrigger
"smap <C-E> <Plug>snipMateNextOrTrigger

" vim-easy-align
" ---------------------------------
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
"vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
"nmap ga <Plug>(EasyAlign)

" Tagbar
" ---------------------------------
"nmap <F8> :TagbarToggle<CR>
"let g:tagbar_width = 30 "default size is 40
"let g:tagbar_sort = 0 "1: Sorted by name, 0: Sorted by scope
"let g:tagbar_autopreview = 1
"let g:tagbar_previewwin_pos = "aboveleft"

" Airline
" ---------------------------------
" set status line
set laststatus=2
" enable powerline-fonts
let g:airline_powerline_fonts = 1
"let g:airline_theme='powerlineish'
let g:airline_theme='luna'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1

" =================================
" Vim Shortcut
" =================================
" Tab Switch
" next tab
noremap <leader>] gt
" previous tab
noremap <leader>[ gT
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggle the line number
nmap <C-A><C-A> :set invnumber<CR>

" Undo shortcut
nnoremap <F9> :u<CR>

" Toggle paste in insert mode
set pastetoggle=<F10>

" Delete all trailing whitespace.
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Read the code template
nmap <C-H><C-H> :r ~/.vim/templates/foo.html<CR>

" Resize split window of vim
" ---------------------------------
" resize vertical split window
nmap <C-Left> <C-W><
nmap <C-Right> <C-W>>
" resize horzontal split window
nmap <C-Up> <C-W>+
nmap <C-Down> <C-W>-

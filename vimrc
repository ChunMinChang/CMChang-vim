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

" resize vertical split window
nmap <C-Left> <C-W><
nmap <C-Right> <C-W>>
" resize horzontal split window
nmap <C-Up> <C-W>+
nmap <C-Down> <C-W>-

" =================================
" Color Scheme
" =================================
colorscheme jellybeans

" =================================
" Plugins
" =================================
" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" Powerline
" ---------------------------------
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
" set laststatus=2

" Airline
" ---------------------------------
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'


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
let g:syntastic_cpp_check_header = 1

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

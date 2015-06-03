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

" +--------+
" | Indent |
" +--------+
NeoBundle 'nathanaelkane/vim-indent-guides'

" +---------------------+
" | Syntax Highlighting |
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
" | Text-align |
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
" | File Open Searching |
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
" | Syntax Checking |
" +-----------------+
" syntastic
"NeoBundle 'scrooloose/syntastic'
" >> YouCompleteMe already has this feature!

" +------------------------+
" | source code navigation |
" +------------------------+
" Tagbar(need ctags)
NeoBundle 'majutsushi/tagbar'

" Cscope(need cscope)
NeoBundle 'vim-scripts/cscope.vim'

" +---------+
" | Airline |
" +---------+
NeoBundle 'bling/vim-airline'

" Integrating with powerline fonts
NeoBundle 'powerline/fonts', {
  \ 'build'   : {
    \ 'mac'     : './install.sh',
    \ 'linux'   : './install.sh',
    \ 'unix'    : './install.sh',
    \ 'windows' : './install.sh',
    \ 'cygwin'  : './install.sh'
  \ }
\ }

call neobundle#end()

" Required:
filetype plugin indent on

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" :NeoBundleClean         - automatically remove unused bundles
" :NeoBundleUpdate        - automatically update all bundles
" More commands: https://github.com/Shougo/neobundle.vim/blob/master/doc/neobundle.txt

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
" ctags and cscope
" =================================
" In windows, the delete commands should be changed to windows format.
" for exampe, delete("./"."tags") should be changed to
"   let dir = getcwd()
"   delete(dir."\\"."tags")
function UpdateCsTag()
  " Delete the current (ctags)tags file
  if filereadable("tags")
    let tagsdeleted=delete("./"."tags")
    if(tagsdeleted!=0)
      echohl WarningMsg | echo "Fail to delete the tags!" | echohl None
      return
    endif
  endif
  " Disconnect to the current cscope database
  if has("cscope")
    " Kill a connection
    silent! execute "cs kill -1"
  endif
  " Delete the current cscope file: cscope.files
  if filereadable("cscope.files")
    let csfilesdeleted=delete("./"."cscope.files")
    if(csfilesdeleted!=0)
      echohl WarningMsg | echo "Fail to delete the cscope.files" | echohl None
      return
    endif
  endif
  " Delete the current cscope file: cscope.out
  if filereadable("cscope.out")
    let csoutdeleted=delete("./"."cscope.out")
    if(csoutdeleted!=0)
      echohl WarningMsg | echo "Fail to delete the cscope.out" | echohl None
      return
    endif
  endif
  if filereadable("cscope.in.out")
    let csinoutdeleted=delete("./"."cscope.in.out")
    if(csinoutdeleted!=0)
      echohl WarningMsg | echo "Fail to delete the cscope.in.out" | echohl None
      return
    endif
  endif
  if filereadable("cscope.po.out")
    let cspooutdeleted=delete("./"."cscope.po.out")
    if(cspooutdeleted!=0)
      echohl WarningMsg | echo "Fail to delete the cscope.po.out" | echohl None
      return
    endif
  endif
  if(executable('ctags'))
    " This line may be different depending one the programming language
    "silent! execute "!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q ."
    " If error 'Format error in tags file' happen when use the above line, the
    " signatures generated might be too long! Please use the command below:
    silent! execute "!ctags -R --languages=c,c++ --c++-kinds=+px --fields=+iaS --extra=+q"
  endif
  if(executable('cscope') && has("cscope"))
    " This line may be different depending one the programming language
    silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
    silent! execute "!cscope -Rbkq"
    execute "normal :"
    " Connect to new cscope database: cscope.out
    if filereadable("cscope.out")
      exe "cs add cscope.out"
    else
      echohl WarningMsg | echo "Fail to connect to cscope database: cscope.out" | echohl None
      return
    endif
  endif
endfunction

map <F12> :call UpdateCsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>


" =================================
" Plugins
" =================================
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
let g:ycm_confirm_extra_conf = 0 "Prevent to ask ..Found .../.ycm_extra_conf.py. Load?

" Tagbar
" ---------------------------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width = 30 "default size is 40
let g:tagbar_sort = 0 "1: Sorted by name, 0: Sorted by scope
let g:tagbar_autopreview = 1
let g:tagbar_previewwin_pos = "aboveleft"

" Airline
" ---------------------------------
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

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

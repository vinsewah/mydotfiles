set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" Powerline
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Powerline setup
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set laststatus=2 " last window always has a status line

" Install Fugitive Git Plugin
Bundle 'tpope/vim-fugitive'
 
" NerdTree is a filebrowser that pops up in a split when you need it and
" features a tree like file browser (hence the tree part in the name)
Bundle 'scrooloose/nerdtree'

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Show hidden files in NerdTree
let NERDTreeShowHidden=1
" autopen NERDTree and focus cursor in new document
" autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

Plugin 'jistr/vim-nerdtree-tabs'

" CtrlP
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

if executable('ag')
 " Use ag over grep
 set grepprg=ag\ --nogroup\ --nocolor
 " Use ag in CtrlP for listing files. Lightning fast and respects
 " gitignore
 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Ack
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

" Vim color schems
Plugin 'flazz/vim-colorschemes'

" ------------
" Start Python Stuff 

" Code folding
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Auto indent
Plugin 'vim-scripts/indentpython.vim'

" Auto complete
Bundle 'Valloric/YouCompleteMe'

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Syntax highlighting and checking
Plugin 'scrooloose/syntastic'

let python_highlight_all=1

" Add PEP8 checking
Plugin 'nvie/vim-flake8'
" Make your code look pretty 
let python_highlight_all=1

" End Python Stuff
" ----------------

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax on
syntax on 

" Enable number lines
set nu 

" Map <leader> key to comma
let mapleader=","

" Real programmers don't use TABs but spaces
set tabstop=4 " tab spacing
set softtabstop=4 " unify
set shiftwidth=4 " indent/outdent by 4 columns
set shiftround " always indent to the nearest tab stop
set expandtab " use spaces instead of tabs

" Make search case insensitive
set hlsearch 
set incsearch
set ignorecase
set smartcase

" Set color scheme
colorscheme molokai

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu 

" specify different areas of the screen where the splits should occur
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

 " Flag whitespace
" define BadWhitespace before using in a match
" highlight BadWhitespace ctermbg=red guibg=darkred
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" This will give you the standard four spaces when you hit tab, ensure your line length doesn’t go beyond 80 characters, and store the file in a unix format so you don’t get a bunch of conversion issues when checking into GitHub and/or sharing with other users. 
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 


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

" Don't autofold code
let g:pymode_folding = 0

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

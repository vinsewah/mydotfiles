set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Map <leader> key to comma
let mapleader=","

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

" autopen NERDTree and focus cursor in new document
" autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

let NERDTreeIgnore = ['\.pyc$']

Plugin 'jistr/vim-nerdtree-tabs'

" CtrlP
Bundle 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
let g:ctrlp_working_path_mode = 'ra'

if executable('ag')
 	" Use ag over grep
 	set grepprg=ag\ --nogroup\ --nocolor
 	" Use ag in CtrlP for listing files. Lightning fast and respects
 	" gitignore
 	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
 	" ag is fast enough that CtrlP doesn't need to cache
 	let g:ctrlp_use_caching = 0
	set grepformat=%f:%l:%c:%m,%f:%l:%m
    " nnoremap K :silent! grep! "\b<C-r><C-w>\b"<CR>:cwindow<CR>:redraw!<CR>
    nnoremap K :silent! Ack! -Q <C-r>=expand('<cword>')<CR>

    command! -nargs=+ -complete=file_in_path -bar Ag silent grep! <args>|cwindow|redraw!
    let g:ackprg = 'ag --vimgrep --nogroup --nocolor --column'
endif

" Ack
Plugin 'mileszs/ack.vim'

" Vim color schems
Plugin 'flazz/vim-colorschemes'

Plugin 'jiangmiao/auto-pairs'

" Async commands
Bundle 'tpope/vim-dispatch'

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

" Add PEP8 checking
Plugin 'nvie/vim-flake8'

"" Highlight groups for errors
" pep8 errors
highlight default Flake8_Error
            \ ctermbg=DarkRed ctermfg=Red cterm=bold
            \ guibg=DarkRed   guifg=Red   gui=bold
" pep8 warnings
highlight default Flake8_Warning
            \ ctermbg=Yellow ctermfg=DarkYellow cterm=bold
            \ guibg=Yellow   guifg=DarkYellow   gui=bold
" PyFlakes codes
highlight default Flake8_PyFlake
            \ ctermbg=DarkBlue ctermfg=Blue cterm=bold
            \ guibg=DarkBlue   guifg=Blue   gui=bold
" McCabe complexity warnings
highlight default Flake8_Complexity
            \ ctermbg=DarkBlue ctermfg=Blue cterm=bold
            \ guibg=DarkBlue   guifg=Blue   gui=bold
" naming conventions
highlight default Flake8_Naming
            \ ctermbg=DarkBlue ctermfg=Blue cterm=bold
            \ guibg=DarkBlue   guifg=Blue   gui=bold

" Make your code look pretty 
let python_highlight_all=1

" Taglist
Bundle "taglist.vim"
let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'  " Proper ctags location
nnoremap <Leader>t :TlistToggle<CR>

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" This will give you the standard four spaces when you hit tab, ensure your line length doesn’t go beyond 80 characters, and store the file in a unix format so you don’t get a bunch of conversion issues when checking into GitHub and/or sharing with other users. 
au BufNewFile,BufRead *.py
    \ set tabstop=4 | " tab spacing
    \ set softtabstop=4 | " unify
    \ set shiftwidth=4 | " indent/outdent by 4 columns
    \ set textwidth=120 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 
    \ set shiftround " always indent to the nearest tab stop
" End Python Stuff
" ----------------

" Automatically update tag files
Plugin 'craigemery/vim-autotag'
let g:autotagTagsFile = "./tags"
set tags=./.tags;$HOME/.tags
set autochdir

Bundle "kshenoy/vim-signature"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax on
syntax on 

" Enable number lines
set nu 

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

" Tab spacing
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set shiftround      " always indent to the nearest tab stop

" Navigate between files stored in buffer
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" Resizing windows
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>

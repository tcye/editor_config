let mapleader=","
let g:mapleader = ","
nnoremap \ ,

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
map <leader>sa ggVG
nnoremap U <C-r>

set clipboard=unnamed

set hlsearch
set incsearch
set ignorecase
set smartcase
set number
set scrolloff=7
set history=500
set backspace=indent,eol,start

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz/,/:

nnoremap <leader>f <C-f>
nnoremap <leader>b <C-b>
nnoremap <leader>d <C-d>
nnoremap <leader>u <C-u>

nnoremap H ^
nnoremap L g_

noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

imap <C-BS> <C-w>

vnoremap < <gv
vnoremap > >gv

map Y y$

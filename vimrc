set nocompatible

set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

colorscheme desert
syntax on
autocmd GUIEnter * simalt ~x
set guifont=Consolas:h11:cANSI:qDRAFT
set guioptions-=m
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=b

set number
set nowrap
set shiftround
set clipboard=unnamed
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

let mapleader=","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
inoremap <esc> <nop>

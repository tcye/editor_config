" Vim Plug ------------------------------- {{{
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator',{'branch':'stable'}
Plug 'Yggdroot/LeaderF'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'editorconfig/editorconfig-vim'
Plug 'dyng/ctrlsf.vim'
call plug#end()
" }}}

" Vimscript file setttings --------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" GUI settings --------------------------- {{{
if has('gui_running')
    " autocmd GUIEnter * simalt ~x
    set guifont=Consolas:h11:cANSI:qDRAFT
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
    set lines=35 columns=118
endif
" }}}

" Common settings ----------------------- {{{
colorscheme evening
syntax on
filetype plugin indent on

set laststatus=2
set t_Co=256

set nocompatible
set novisualbell
set noerrorbells

set scrolloff=5
set scrolljump=5
set sidescroll=3
set sidescrolloff=3
set wrap
set ruler
set rulerformat=%35(%=%r%Y\|%{&ff}\|%{strlen(&fenc)?&fenc:'none'}\ %m\ %l/%L%)
set whichwrap=b,s,<,>,[,]

set fileformat=unix
set splitright splitbelow
set backspace=indent,eol,start
set smarttab expandtab
set autoindent smartindent
set tabstop=4 softtabstop=4 shiftwidth=4
set ignorecase smartcase incsearch hlsearch

set nobackup noswapfile
set history=200
set autoread

set numberwidth=4
set number
set showcmd
set shiftround
set clipboard=unnamed,unnamedplus
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

set cc=80

" }}}

" Key map settings ---------------------- {{{
let mapleader=","
nnoremap <leader>ee :vsplit $MYVIMRC<cr>
nnoremap <leader>ss :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :bd<cr>
nnoremap <leader>wq :w<cr>:bd<cr>
nnoremap j gj
nnoremap k gk

inoremap jk <esc>
inoremap <esc> <nop>

inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
nnoremap U <c-r>
nnoremap Y y$

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

nnoremap <a-down> :bn!<cr>
nnoremap <a-up> :bp!<cr>
inoremap <a-down> <esc>:bn!<cr>
inoremap <a-up> <esc>:bp!<cr>
inoremap <c-bs> <c-w>

vnoremap < <gv
vnoremap > >gv
" }}}

" NerdTree setttings -------------------{{{
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1  
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" AirLine -------------------{{{
let g:airline#extensions#tabline#enabled=1
nmap <tab> :bn<cr>
" }}}

" YCM Settings ----------------{{{
let g:ycm_python_binary_path='python3'
let g:ycm_semantic_triggers={
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
"highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
"highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt=0
let g:ycm_show_diagnostics_ui=0
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_strings=1
let g:ycm_filetype_whitelist={ 
            \ "c":1,
            \ "cpp":1, 
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ "zimbu":1,
            \ }
let g:ycm_filetype_blacklist={ 
            \ 'tagbar':1,
            \ 'nerdtree':1,
            \ 'txt':1,
            \ }
" }}}

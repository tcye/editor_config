" Vim Plug ------------------------------- {{{
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim',{'as':'dracula'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'Valloric/YouCompleteMe'
Plug 'Yggdroot/LeaderF'
Plug 'editorconfig/editorconfig-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'moll/vim-bbye'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/vim-easy-align'
Plug 'w0rp/ale'
Plug 'embear/vim-localvimrc'
Plug '907th/vim-auto-save'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tenfyzhong/CompleteParameter.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'guns/xterm-color-table.vim'
call plug#end()
" }}}

" Vimscript file setttings --------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType cpp setlocal foldmethod=syntax
    autocmd FileType python setlocal foldmethod=indent
augroup END
set foldlevelstart=20
" }}}

" Common settings ----------------------- {{{
"colorscheme evening
syntax on
"let g:dracula_italic=0
color dracula
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
set whichwrap=b,s,<,>,[,]

set fileformat=unix
set splitright splitbelow
set backspace=indent,eol,start
set smarttab expandtab
set autoindent smartindent
set tabstop=4 softtabstop=4 shiftwidth=4
set ignorecase smartcase incsearch hlsearch

set nobackup noswapfile
set history=100
set autoread

set numberwidth=4
set number
set showcmd
set shiftround
set clipboard=unnamed,unnamedplus
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set cc=80
autocmd InsertEnter,InsertLeave * se cul!

" }}}

" Key map settings ---------------------- {{{
let mapleader=","
nnoremap <leader>ee :vsplit $MYVIMRC<cr>
nnoremap <leader>ss :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :Bdelete<cr>
nnoremap <leader>wq :w<cr>:Bdelete<cr>
nnoremap j gj
nnoremap k gk

inoremap jk <esc>
inoremap <c-h> <left>
"inoremap <c-j> <down>
"inoremap <c-k> <up>
inoremap <c-l> <right>

nnoremap <c-h> <c-w>h
"nnoremap <c-j> <c-w>j
"nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_
nnoremap U <c-r>
nnoremap Y y$

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

vnoremap < <gv
vnoremap > >gv
" }}}

" NerdTree setttings -------------------{{{
nmap <F1> :NERDTreeToggle <Bar> if &filetype=='nerdtree' <Bar> wincmd p <Bar> endif <CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" AirLine -------------------{{{
let g:airline_theme='simple'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
nmap <tab> :bn<cr>
" }}}

" YCM Settings ----------------{{{
let g:ycm_python_binary_path='python3'
"let g:ycm_semantic_triggers={
            "\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            "\ 'cs,lua,javascript': ['re!\w{2}'],
            "\ }
set completeopt-=preview
let g:ycm_add_preview_to_completeopt=0
let g:ycm_show_diagnostics_ui=0
"let g:ycm_confirm_extra_conf=0
"let g:ycm_collect_identifiers_from_tags_files=1
"let g:ycm_collect_identifiers_from_comments_and_strings=1
"let g:ycm_min_num_of_chars_for_completion=2
"let g:ycm_cache_omnifunc=0
"let g:ycm_seed_identifiers_with_syntax=1
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
nmap <leader>jd :YcmCompleter GoTo<CR>
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
" }}}

" LeaderF -------------------{{{
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
" }}}

" CtrlSF -------------------{{{
let g:ctrlsf_position='right'
let g:ctrlsf_winsize='35%'
let g:ctrlsf_auto_focus={"at":"start"}
nmap <leader>sf <Plug>CtrlSFPrompt
vmap <leader>sf <Plug>CtrlSFVwordPath
nmap <F2> :CtrlSFToggle<CR>
" }}}

" EasyAlign -------------------{{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}}

" ale -------------------{{{
let g:ale_completion_enabled=0
let g:ale_linters_explicit=1
let g:ale_sign_column_always=1
let g:airline#extensions#ale#enabled=1
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]'
let g:ale_linters={
            \ 'python': ['pylint'],
            \ 'cpp': ['clangtidy'],
            \ }
nmap <silent> <c-k> <Plug>(ale_previous_wrap)
nmap <silent> <c-j> <Plug>(ale_next_wrap)
"highlight clear ALEErrorSign
"highlight clear ALEWarningSign
let g:ale_sign_error='✘'
let g:ale_sign_warning='⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=124
highlight ALEWarningSign ctermbg=NONE ctermfg=45
"hi link ALEErrorSign Error
"hi link ALEWarningSign Warning
" }}}

" vim auto save -------------------{{{
let g:auto_save=1
" }}}


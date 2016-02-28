
set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-pathogen'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'tomasr/molokai'
Plug 'Shougo/deoplete.nvim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'millermedeiros/vim-statline'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'
Plug 'bling/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'klen/python-mode'
call plug#end()

autocmd BufEnter * :syntax sync fromstart

filetype plugin indent on
filetype plugin on
syntax enable

let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set background=dark
colorscheme solarized

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'

"function! Completefunc(findstart, base)
"  return "\<c-x>\<c-p>"
"endfunction

set hidden
set enc=utf-8
set nowrap
set laststatus=2
set mouse-=a
set updatetime=500
set colorcolumn=80
set number showmatch
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent smarttab
set autoindent copyindent smartindent
set noswapfile nobackup
set nowb nowrap linebreak

set complete=.,w,b,u,t
set completeopt=longest,menuone
set completeopt -=preview

let mapleader=","
let maplocalleader="\\"
let g:python3_host_skip_check = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#package_dot = 1

set pastetoggle=<F2>
map <F3> :NERDTreeToggle
map <F4> :TlistToggle
noremap <leader>l :TagbarToggle

let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_mruf_max=450
let g:ctrlp_max_files=0
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

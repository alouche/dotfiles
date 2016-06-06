" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'
Plug 'bling/vim-airline'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go'
Plug 'klen/python-mode'
Plug 'rust-lang/rust.vim'
Plug 'vimwiki/vimwiki'
call plug#end()

syntax on
filetype plugin indent on

let mapleader=","
let maplocalleader="\\"

set autoread
set hidden
set enc=utf-8
set nowrap
set nofoldenable
set laststatus=2
set mouse-=a
set updatetime=500
set colorcolumn=80
set number showmatch
set splitbelow splitright
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent smarttab
set autoindent copyindent smartindent
set noswapfile nobackup
set nowb nowrap linebreak
set complete=.,w,b,u,t
set completeopt=longest,menuone
set completeopt -=preview
set background=dark

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>l :CtrlPLine<cr>
nnoremap <leader>l :TagbarToggle

" fix syntax highlighting
autocmd BufEnter    * :syntax sync fromstart
" clear whitespace
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'

let g:python3_host_skip_check = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#package_dot = 1

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

"function! Completefunc(findstart, base)
"  return "\<c-x>\<c-p>"
"endfunction

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/taglist.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'fatih/vim-go'
Plug 'klen/python-mode'
Plug 'rust-lang/rust.vim'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
call plug#end()

syntax on
filetype plugin indent on
color gruvbox
set background=dark

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
autocmd BufWritePre * :%s/\s\+$//e
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:airline_theme='tomorrow'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_section_z = '𝕕 %2b 𝕙 0x%02B 𝕣%{v:register} %4l/%L %3v'
" }
let g:rehash256 = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:python3_host_skip_check = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#package_dot = 1

"function! Completefunc(findstart, base)
"  return "\<c-x>\<c-p>"
"endfunction

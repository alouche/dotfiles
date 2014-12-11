
set nocompatible                          " forget about vi compatibility

" pathogen rules!
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" -----------------------------------------------------------------
" Settings
" -----------------------------------------------------------------

" perform syntax highlighting from start
autocmd BufEnter * :syntax sync fromstart
set hidden                                " enable hidden buffers
set ttyfast                               " redraw fast
" fix backspace if terminal isn't setup sanely
imap <C-?> <C-h>
set viminfo='50,\"1000,:100,n~/.viminfo   " store my editing info
set history=1000
set backup
set writebackup 
set swapfile
set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.vim-tmp
set backupdir=~/.vim-tmp
set directory=~/.vim-tmp
set tabpagemax=3
if has('title')
  set title
  set titlestring=%t%(\ [%R%M]%)
endif

set complete=.,w,b,u,t
set completeopt=longest,menuone
set completeopt -=preview

let mapleader=","
let maplocalleader=",,"

" -----------------------------------------------------------------
" Eveything to do with Visual (presentation, status, color ...)
" -----------------------------------------------------------------

set noerrorbells                          " only cows use bells
set visualbell                            " somehow this is needed - I did not bother to look too much into it!
autocmd VimEnter * set vb t_vb= "         " stop the visual blinking
set ruler
set rulerformat=%l:%c ruler
set splitbelow
set nohlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set foldclose=                            " do not fold automatically
set foldenable
set foldmethod=marker                     " text folding
set scrolloff=8
set mat=5
set ch=2
set showcmd
set showmode
set nocursorline
set nocursorcolumn
set laststatus=2
set background=dark
syntax sync minlines=256
set synmaxcol=128
set re=1
au VimResized * :wincmd =

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

filetype plugin indent on
filetype plugin on
syntax enable
set t_Co=256                              " use 256 inside gnome terminal with CSApprox plugin
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
let g:rehash256 = 1

" -----------------------------------------------------------------
" Format
" -----------------------------------------------------------------

set enc=utf-8
set shiftwidth=2
set tabstop=2
set expandtab
set softtabstop=2
set expandtab
set smarttab
set autoindent
set copyindent
set smartindent
"set cindent
"set cinkeys=!^                          " do it only when requested
"set cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4

setlocal indentexpr=GoogleCppIndent()

autocmd BufReadCmd //depot/* exe "0r !p4 print -q <afile>"
autocmd BufReadCmd //depot/* 1
autocmd BufReadCmd //depot/* set readonly 

" -----------------------------------------------------------------
" Shortcuts
" -----------------------------------------------------------------

set pastetoggle=<F2>

map <F3> :NERDTreeToggle<CR>
map <F4> :TlistToggle<CR>

noremap <leader>l :TagbarToggle<CR>
noremap <leader>r :!ruby %<cr>

nnoremap <silent> <C-s> :call RelatedSpecVOpen()<CR>
nnoremap <silent> ,<C-s> :call RelatedSpecOpen()<CR>

" -----------------------------------------------------------------
" Neocomplete
" -----------------------------------------------------------------

let g:neocomplete#enable_at_startup = 1

" -----------------------------------------------------------------
" Syntastic
" -----------------------------------------------------------------

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--select=F,C9 --max-complexity=10'


" -----------------------------------------------------------------
" Airline
" -----------------------------------------------------------------

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" -----------------------------------------------------------------
" Go stuff (vim-go config etc.)
" -----------------------------------------------------------------

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>t <Plug>(go-def-tab)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <Leader>d <Plug>(go-doc)

" -----------------------------------------------------------------
" Ctrlp
" -----------------------------------------------------------------

let g:ctrlp_cmd = 'CtrlPMRU'  
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10 " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et' " jump to a file if it's open already
let g:ctrlp_mruf_max=450 " number of recently opened files
let g:ctrlp_max_files=0 " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

func! MyPrtMappings()
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
endfunc

func! MyCtrlPTag()
  let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ }
  CtrlPBufTag
endfunc

let g:ctrlp_buffer_func = { 'exit': 'MyPrtMappings' }
com! MyCtrlPTag call MyCtrlPTag()

let g:ctrlp_buftag_types = {
  \ 'go' : '--language-force=go --golang-types=ftv',
  \ 'markdown' : '--language-force=markdown --markdown-types=hik',
  \ }

" -----------------------------------------------------------------
" Functions (used across the configuration)
" -----------------------------------------------------------------

let g:tagbar_usearrows = 1

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
\ }

" From google.vim by Konstantin Lepa
function! GoogleCppIndent()
    let l:cline_num = line('.')

    let l:orig_indent = cindent(l:cline_num)

    if l:orig_indent == 0 | return 0 | endif

    let l:pline_num = prevnonblank(l:cline_num - 1)
    let l:pline = getline(l:pline_num)
    if l:pline =~# '^\s*template' | return l:pline_indent | endif

    if l:orig_indent != &shiftwidth | return l:orig_indent | endif

    let l:in_comment = 0
    let l:pline_num = prevnonblank(l:cline_num - 1)
    while l:pline_num > -1
        let l:pline = getline(l:pline_num)
        let l:pline_indent = indent(l:pline_num)

        if l:in_comment == 0 && l:pline =~ '^.\{-}\(/\*.\{-}\)\@<!\*/'
            let l:in_comment = 1
        elseif l:in_comment == 1
            if l:pline =~ '/\*\(.\{-}\*/\)\@!'
                let l:in_comment = 0
            endif
        elseif l:pline_indent == 0
            if l:pline !~# '\(#define\)\|\(^\s*//\)\|\(^\s*{\)'
                if l:pline =~# '^\s*namespace.*'
                    return 0
                else
                    return l:orig_indent
                endif
            elseif l:pline =~# '\\$'
                return l:orig_indent
            endif
        else
            return l:orig_indent
        endif

        let l:pline_num = prevnonblank(l:pline_num - 1)
    endwhile

    return l:orig_indent
endfunction

function! BufferCount()
  let s:buffer_count = len(filter(range(1,bufnr('$')), 'buflisted(v:val)'))
  return s:buffer_count
endfunction

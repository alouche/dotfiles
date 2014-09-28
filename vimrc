
set nocompatible                          " forget about vi compatibility

" pathogen rules!
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" -----------------------------------------------------------------
" Generic Settings
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
set cursorline
set laststatus=2
"set statusline=[%{BufferCount()}\:%n]\ %<[L%l/%L:C%c\ %P]%2*%h%w%m%r%*[%{Pwd()}/%f]\ %y\ %{fugitive#statusline()}\ %4*%#warningmsg#%{SyntasticStatuslineFlag()}%*
"set mouse=a

filetype plugin indent on
filetype plugin on
syntax enable
set t_Co=256                              " use 256 inside gnome terminal with CSApprox plugin
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized
let g:rehash256 = 1
"colorscheme molokai

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
"set cindent                             " I like C indents
"set cinkeys=!^                          " do it only when requested
"set cinoptions=h1,l1,g1,t0,i4,+4,(0,w1,W4

setlocal indentexpr=GoogleCppIndent()
set omnifunc=syntaxcomplete#Complete

autocmd BufReadCmd //depot/* exe "0r !p4 print -q <afile>"
autocmd BufReadCmd //depot/* 1
autocmd BufReadCmd //depot/* set readonly 

" -----------------------------------------------------------------
" Shortcuts
" -----------------------------------------------------------------

set pastetoggle=<F2>

let mapleader=","
let maplocalleader="\\"
let g:tagbar_usearrows = 1

let b:undo_indent = "setl sw< ts< sts< et< tw< wrap< cin< cino< inde<"

map <F3> :NERDTreeToggle<CR>
map <F4> :TlistToggle<CR>

noremap <leader>l :TagbarToggle<CR>
noremap <leader>r :!ruby %<cr>

nnoremap <leader>y :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>pg :YcmCompleter GoTo<CR>
nnoremap <leader>pd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>pc :YcmCompleter GoToDeclaration<CR>


nnoremap <silent> <C-s> :call RelatedSpecVOpen()<CR>
nnoremap <silent> ,<C-s> :call RelatedSpecOpen()<CR>

" -----------------------------------------------------------------
" YouCompleteMe
" -----------------------------------------------------------------

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_extra_conf_globlist = ['~/code/*']
let g:ycm_filetype_specific_completion_to_disable = {'javascript': 1}

set omnifunc=syntaxcomplete#Complete

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

au BufRead,BufNewFile *.go set filetype=go
au BufWritePost *.go silent! !ctags -R &
"au FileType go autocmd BufWritePre <buffer> Fmt
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

" -----------------------------------------------------------------
" Functions (used across the configuration)
" -----------------------------------------------------------------

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

    " TODO: I don't know to correct it:
    " namespace test {
    " void
    " ....<-- invalid cindent pos
    "
    " void test() {
    " }
    "
    " void
    " <-- cindent pos
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

function! Pwd()
  let s:curdir = substitute(getcwd(), '/home/aabbas', "~", "g")
  return s:curdir
endfunction

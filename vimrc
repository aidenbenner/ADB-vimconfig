
" Plugins  
call plug#begin('~/.vim/plugged')

" Colors
Plug 'jacoborus/tender.vim'

" Misc
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdcommenter'

" Autocomplete
Plug 'valloric/youcompleteme'

" Markdown 
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'

" JS 
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'

call plug#end()

" Use system clipboard
set clipboard=unnamedplus

" UI 
set ruler
set number
set cursorline
set nocompatible
set showcmd 
set lazyredraw

let loaded_matchparen = 1

filetype plugin indent on
filetype plugin on 

set spell spelllang=en_us

let mapleader = "\<Space>"

"Colors"
syntax on
set t_Co=256
colorscheme tender 

" For bash for windows 
set term=screen-256color
set t_ut=

"Misc "
set nocp
set wildmenu
set backspace=eol,start,indent
set autoread
set magic

set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

"md, markdown == mkd
au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd

map <C-n> :NERDTreeToggle<CR>

" Light line
set laststatus=2

" Change swp file location

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

"Tabs "
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent
filetype indent plugin on

"Search : 
set ignorecase
set incsearch
set hlsearch
set smartcase
set showmatch

"Folding 
set foldenable 
set foldlevelstart=10
set foldmethod=indent 

"Splits 
set splitbelow
set splitright

" Insert mode bindings 
inoremap jk <Esc>

" Normal mode bindings 
" split settings " 
nmap <S-Tab> :tabn <CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>t :call CompTemp()  <cr>
nnoremap <leader>m :w <bar> exec ':!make' <CR> 

autocmd filetype c nnoremap <leader>r :w <bar> exec '!gcc -std=c99 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <leader>r :w <bar> exec '!g++ -g -std=c++11 '.shellescape('%').' -o  '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cc nnoremap <leader>r :w <bar> exec '!g++ -g -std=c++11 '.shellescape('%').' -o ' .shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype py nnoremap <leader>r :w <bar> exec '!python3 ' shellescape(@%, 1)<CR>
autocmd filetype sh nnoremap <leader>r :w <bar> exec '!sh ' shellescape(@%, 1)<CR>

function CompTemp()
  :read ~/.vim/templates/comp.cc
endfunction 

" Config for YouCompleteMe
let g:ycm_complete_in_comments=0
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'


" general
" ------------------------------------------------------------------------------

set termguicolors
set background=dark
set noshowmode

set path=.,**
" set wildignore+=**/node_modules/**
set encoding=UTF-8

let mapleader=","
let g:mapleader=","
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

syntax enable

set clipboard+=unnamedplus

set hidden
set updatetime=100
set timeoutlen=300
set signcolumn=yes

" Avoid showing message extra message when using completion
set shortmess+=c

" scroll
" ------------------------------------------------------------------------------

set scrolloff=4
set lazyredraw

" backup files
" ------------------------------------------------------------------------------

set nobackup
set noswapfile

" folding
" ------------------------------------------------------------------------------

set foldmethod=expr
set nofoldenable
set foldexpr=nvim_treesitter#foldexpr()

" indentation
" ------------------------------------------------------------------------------

set shiftwidth=2 tabstop=2 softtabstop=2 expandtab autoindent smartindent

" 80 lines
" ------------------------------------------------------------------------------

set textwidth=80 colorcolumn=80,120
set nowrap
set smartcase

" cursor
" ------------------------------------------------------------------------------

set cursorline

" line numbers
" ------------------------------------------------------------------------------

set number relativenumber

" shortcuts
" ------------------------------------------------------------------------------

inoremap jj <Esc>

" vimrc
" ------------------------------------------------------------------------------

" Edit vimrc configuration file
nnoremap <Leader>e :e $MYVIMRC<CR>

" images & pdf
" ------------------------------------------------------------------------------

autocmd bufenter *.png,*.jpg,*.jpeg,*.svg,*.gif exec "!imv '".expand("%")."' &" | :bd
autocmd bufenter *.pdf exec "!zathura '".expand("%")."' &" | :bw

" term
" ------------------------------------------------------------------------------

nnoremap <Leader>gq :bd!<cr>
tnoremap <Leader><Esc> <C-\><C-n>

" spell
" ------------------------------------------------------------------------------

autocmd BufRead,BufNewFile *.md,*.tex setlocal spell spelllang=en_us,es_es
autocmd FileType gitcommit setlocal spell spelllang=en_us,es_es
set complete+=kspell


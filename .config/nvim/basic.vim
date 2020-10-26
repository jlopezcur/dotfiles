" general
" ------------------------------------------------------------------------------

set termguicolors
set background=dark
set noshowmode

set path=.,**
" set wildignore+=**/node_modules/**
set encoding=UTF-8
set scrolloff=4

let mapleader=","
let g:mapleader=","
set completeopt=menuone,noinsert,noselect

syntax enable

set clipboard+=unnamedplus

set hidden
set updatetime=100
set timeoutlen=300
set signcolumn=yes

set shortmess+=c

" backup files
" ------------------------------------------------------------------------------

set nobackup
set noswapfile

" folding
" ------------------------------------------------------------------------------

set foldmethod=syntax
set nofoldenable
set foldlevel=99

" mouse
" ------------------------------------------------------------------------------

set mouse=a

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

" hidden chars
" ------------------------------------------------------------------------------

" set list
" set lcs=eol:¬

" conceal
" ------------------------------------------------------------------------------

" set conceallevel=0
" let g:vim_markdown_conceal = 0
" let g:tex_conceal = ""
" let g:vim_markdown_math = 1
" let g:vim_markdown_conceal_code_blocks = 0

" shortcuts
" ------------------------------------------------------------------------------

inoremap jj <Esc>

" vimrc
" ------------------------------------------------------------------------------

" Edit vimrc configuration file
nnoremap <Leader>e :e $MYVIMRC<CR>

" tests
" ------------------------------------------------------------------------------

" Test all
nnoremap <Leader>ta :terminal npm run test<cr>
nnoremap <Leader>tt :terminal npm run test -- %<cr>

" Eslint
nnoremap <Leader>ll :terminal npm run eslint<cr>
nnoremap <Leader>lc :terminal npm run eslint -- %<cr>
nnoremap <Leader>lf :terminal npm run eslint -- --fix<cr>

" Storybook
nnoremap <Leader>ss :terminal npm start<cr>

" images
" ------------------------------------------------------------------------------

autocmd bufenter *.png,*.jpg,*.jpeg exec "!sxiv -qp '".expand("%")."'" | :bd
autocmd bufenter *.gif exec "!mplayer '".expand("%")."'" | :bd
autocmd bufenter *.pdf exec "! zathura '".expand("%")."'" | :bw

" term
" ------------------------------------------------------------------------------

nnoremap <Leader>gq :bd!<cr>
tnoremap <Esc> <C-\><C-n>

let g:netrw_browsex_viewer="setsid xdg-open"

" spell
" ------------------------------------------------------------------------------

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us
set complete+=kspell


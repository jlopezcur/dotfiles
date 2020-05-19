
" Enviroment
" set nocompatible
set path+=**
set wildmenu
set wildignore+=**/node_modules/**
set encoding=UTF-8
set nobackup
set nowritebackup
" set viminfo+=!
let $MYVIMRC="~/.config/nvim/init.vim"
set shell=/bin/bash

filetype plugin indent on
syntax on
" set keywordprg=":help"
set backspace=indent,eol,start
set ttimeout
set ttimeoutlen=50
set autoread

" Search
set incsearch
set hlsearch

" Leader
let mapleader = ","
let g:mapleader = ","

" Split to bottom and right
set splitbelow splitright

" silver searcher instead grep
" ------------------------------------------------------------------------------

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

" terminal
" ------------------------------------------------------------------------------

" tnoremap <Esc><Esc> <C-\><C-n>

" netwr
" ------------------------------------------------------------------------------

let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_altv = 1
let g:netrw_alto = 1

" Per default netrw leaves unmodified vuffers open.
autocmd FileType netrw setl bufhidden=delete

nnoremap <Leader>x :Ex<cr><cr>

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

set tabstop=2
set expandtab " always uses spaces instead of tab characters
set smartindent

" 80 lines
" ------------------------------------------------------------------------------

set textwidth=80
set cc=+1
highlight OverLength ctermfg=red
match OverLength /\%81v.\+/

" cursor
" ------------------------------------------------------------------------------

set cursorline

" line numbers
" ------------------------------------------------------------------------------

set number relativenumber
" TODO make this a toggle
nnoremap <Leader>n :set norelativenumber<CR>


" Hidden Chars
" ------------------------------------------------------------------------------

set list
set lcs=eol:¬

" ==============================================================================
" Plugins
" ==============================================================================

call plug#begin('~/.config/nvim/plugged')

" coc
" https://github.com/neoclide/coc.nvim
" ------------------------------------------------------------------------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" utilsnips
" https://github.com/SirVer/ultisnips
" https://github.com/honza/vim-snippets
" ------------------------------------------------------------------------------

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" coloresque
" https://github.com/gko/vim-coloresque
" ------------------------------------------------------------------------------

Plug 'gorodinskiy/vim-coloresque'

" polyglot
" https://github.com/sheerun/vim-polyglot
" ------------------------------------------------------------------------------

Plug 'sheerun/vim-polyglot'

" Grubvox
" https://github.com/morhetz/gruvbox
" ------------------------------------------------------------------------------

Plug 'morhetz/gruvbox'

" Fuzzy file finder
" https://github.com/junegunn/fzf.vim
" ------------------------------------------------------------------------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" yast.vim
" https://github.com/othree/yajs.vim
" ------------------------------------------------------------------------------

Plug 'othree/yajs.vim' " TS Syntax

" vim-styled-components
" https://github.com/styled-components/vim-styled-components
" ------------------------------------------------------------------------------
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" indentline
" https://github.com/Yggdroot/indentLine
" ------------------------------------------------------------------------------

Plug 'yggdroot/indentline'

" markdown-preview
" https://github.com/iamcco/markdown-preview.nvim
" ------------------------------------------------------------------------------

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" NERDCommenter
" https://github.com/preservim/nerdcommenter
" ------------------------------------------------------------------------------

Plug 'preservim/nerdcommenter'

" Tests
" https://github.com/janko/vim-test
" ------------------------------------------------------------------------------

Plug 'janko/vim-test'

" fugitive
" https://github.com/tpope/vim-fugitive
" https://github.com/airblade/vim-gitgutter
" https://vimawesome.com/plugin/vim-signify
" https://github.com/gregsexton/gitv
" ------------------------------------------------------------------------------

Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'gregsexton/gitv', {'on': ['Gitv']}

" lightline
" https://github.com/itchyny/lightline.vim
" ------------------------------------------------------------------------------

Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()

" ==============================================================================
" Plugins Configuration
" ==============================================================================

" gruvbox
" https://github.com/morhetz/gruvbox
" ------------------------------------------------------------------------------

set background=dark
colorscheme gruvbox

" lightline
" https://github.com/itchyny/lightline.vim
" ------------------------------------------------------------------------------

set laststatus=2      " always show status line
set noshowmode        " no need for mode since lightline is showing too

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo', 'cocstatus', 'currentfunction' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'filename': 'FilenameForLightline'
      \ },
      \ }

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! FilenameForLightline()
  return @%
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" fzf
" https://github.com/junegunn/fzf.vim
" ------------------------------------------------------------------------------

nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>

" polyglot
" https://github.com/sheerun/vim-polyglot
" ------------------------------------------------------------------------------

let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0

" nerdcommenter
" ------------------------------------------------------------------------------

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" coc
" https://github.com/neoclide/coc.nvim
" ------------------------------------------------------------------------------

set hidden
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" coc-prettier
" https://github.com/neoclide/coc-prettier
" ------------------------------------------------------------------------------

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" vimrc
" ------------------------------------------------------------------------------

" Edit vimrc configuration file
nnoremap <Leader>e :e $MYVIMRC<CR>

" Watch changes on this file
augroup vimrc
  au!
  autocmd BufWritePost init.vim source $MYVIMRC | echo "Reloaded vim configuration" | LightlineReload
augroup END

" tests
" ------------------------------------------------------------------------------

" Test all
nnoremap <Leader>ta :terminal npm run test<cr>
nnoremap <Leader>tc :terminal npm run test -- %<cr>

" Eslint
nnoremap <Leader>ll :terminal npm run eslint<cr>
nnoremap <Leader>lc :terminal npm run eslint -- %<cr>
nnoremap <Leader>lf :terminal npm run eslint -- --fix<cr>


"
"     _____  ___
"     | | | / /
"     | | |/ /
"     | |   <
" ___ | | |\ \
" | |_| | | \ \
" |_____|_|__\_\_
"
"
 
" No comments added
" Press <S-K> on any command to see documentation

" ==============================================================================
" plugins
" ==============================================================================

call plug#begin()

" autocompletion
" ------------------------------------------------------------------------------

Plug 'neoclide/coc.nvim', {'branch': 'release'} " https://github.com/neoclide/coc.nvim
Plug 'honza/vim-snippets' " https://github.com/honza/vim-snippets

" highlighting & colors
" ------------------------------------------------------------------------------

Plug 'gruvbox-community/gruvbox' " https://github.com/gruvbox-community/gruvbox
Plug 'yggdroot/indentline' " https://github.com/Yggdroot/indentLine
Plug 'itchyny/lightline.vim' " https://github.com/itchyny/lightline.vim
Plug 'sheerun/vim-polyglot' " https://github.com/sheerun/vim-polyglot

" file management
" ------------------------------------------------------------------------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' " https://github.com/junegunn/fzf.vim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " https://github.com/iamcco/markdown-preview.nvim
Plug 'preservim/nerdtree' " https://github.com/preservim/nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin' " https://github.com/Xuyuanp/nerdtree-git-plugin

" ------------------------------------------------------------------------------

Plug 'preservim/nerdcommenter' " https://github.com/preservim/nerdcommenter
Plug 'janko/vim-test' " https://github.com/janko/vim-test

" vcs
" ------------------------------------------------------------------------------

Plug 'tpope/vim-fugitive' " https://github.com/tpope/vim-fugitive
Plug 'mhinz/vim-signify' " https://github.com/mhinz/vim-signify

call plug#end()

" ==============================================================================
" configuration
" ==============================================================================

let $MYVIMRC="~/.config/nvim/init.vim"

" gruvbox
" ------------------------------------------------------------------------------

colorscheme gruvbox
set termguicolors

" general
" ------------------------------------------------------------------------------

set path+=**
set wildignore+=**/node_modules/**
set encoding=UTF-8
set scrolloff=4
set shell=/usr/bin/zsh

let mapleader = ","
let g:mapleader = ","

syntax enable

set clipboard+=unnamedplus

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

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" 80 lines
" ------------------------------------------------------------------------------

set textwidth=80
set colorcolumn=80,120
highlight ColorColumn ctermbg=0 guibg=#242424
set nowrap
set smartcase

" cursor
" ------------------------------------------------------------------------------

set cursorline

" line numbers
" ------------------------------------------------------------------------------

set number relativenumber

" Hidden Chars
" ------------------------------------------------------------------------------

set list
set lcs=eol:¬

" ==============================================================================
" Plugins Configuration
" ==============================================================================

" lightline
" ------------------------------------------------------------------------------

set noshowmode

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

if ! exists("LightlineReload")
  function! LightlineReload()
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endfunction
endif

if ! exists("FilenameForLightline")
  function! FilenameForLightline()
    return @%
  endfunction
endif

if ! exists("CocCurrentFunction")
  function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
  endfunction
endif

" fzf
" ------------------------------------------------------------------------------

" The Silver Searcher as the main grep tool
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag!<space>

nnoremap <Leader>b :Buffers<CR>
nnoremap <leader>f :Files!<CR>
nnoremap <Leader>g :BCommits!<CR>
nnoremap <Leader>v :GFiles?<CR>

" vim-fugitive
" ------------------------------------------------------------------------------

nmap <leader>gs :G<CR>

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

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-actions',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-styled-components',
    \ 'coc-yaml',
    \ 'coc-python',
    \ 'coc-svg',
    \ 'coc-prettier',
    \ 'coc-vimlsp',
    \ 'coc-xml',
    \ 'coc-yank',
    \ 'coc-json',
    \ 'coc-vimtex',
    \ 'coc-marketplace',
    \ 'coc-import-cost',
    \ 'coc-eslint',
    \ 'coc-svg',
    \ 'coc-markdownlint',
    \ 'coc-texlab',
    \ ]

set hidden
set updatetime=100
set timeoutlen=300
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
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
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

" coc extensions
" ------------------------------------------------------------------------------

command! -nargs=0 Prettier :CocCommand prettier.formatFile " https://github.com/neoclide/coc-prettier

" nerdtree
" ------------------------------------------------------------------------------

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" nnoremap <space>e :NERDTreeFind<CR>
" " nnoremap <space>e g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

nnoremap <silent> <expr> <space>e g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let NERDTreeQuitOnOpen = 1
let g:NERDTreeGitStatusWithFlags = 1
"let g:NERDTreeIgnore = ['^node_modules$']

" open NERDTree automatically if no file were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Autoclose NERDTree if it's the only open window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
      \ b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeShowIgnoredStatus = 1

" vimrc
" ------------------------------------------------------------------------------

" Edit vimrc configuration file
nnoremap <Leader>e :e $MYVIMRC<CR>

" Watch changes on this file
augroup vimrc
  au!
  autocmd BufWritePost init.vim source $MYVIMRC | call coc#client#restart_all() | call LightlineReload() | echom "Reloaded vim configuration"
augroup END

" conceal
" ------------------------------------------------------------------------------

set conceallevel=0
" let g:vim_markdown_conceal = 0
" let g:tex_conceal = ""
" let g:vim_markdown_math = 1
" let g:vim_markdown_conceal_code_blocks = 0

" tests
" ------------------------------------------------------------------------------

" Test all
nnoremap <Leader>ta :terminal npm run test<cr>
nnoremap <Leader>tc :terminal npm run test -- %<cr>

" Eslint
nnoremap <Leader>ll :terminal npm run eslint<cr>
nnoremap <Leader>lc :terminal npm run eslint -- %<cr>
nnoremap <Leader>lf :terminal npm run eslint -- --fix<cr>


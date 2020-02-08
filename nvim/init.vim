
" Enviroment
set nocompatible
set encoding=UTF-8
set nobackup
set nowritebackup
set viminfo+=!
let $MYVIMRC="~/.config/nvim/init.vim"

filetype plugin indent on
syntax on
set keywordprg=":help"
set backspace=indent,eol,start
set ttimeout
set ttimeoutlen=50

" Search
set incsearch
set hlsearch

" Leader
let mapleader = ","
let g:mapleader = ","

" Split
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s

" Split to the bottom by default on horizontal split
set splitbelow

" Split to the right by default on vertical split
set splitright

" ------------------------------------------------------------------------------
" Movement between windows
" ------------------------------------------------------------------------------

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ------------------------------------------------------------------------------
" Grep (Silver Searcher)
" ------------------------------------------------------------------------------

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

" ------------------------------------------------------------------------------
" Folding
" ------------------------------------------------------------------------------

set foldmethod=syntax
set nofoldenable
set foldlevel=99

" ------------------------------------------------------------------------------
" Mouse
" ------------------------------------------------------------------------------

set mouse=a

" ------------------------------------------------------------------------------
" Indentation
" ------------------------------------------------------------------------------

" Tabs
set tabstop=2
" always uses spaces instead of tab characters
set expandtab
set shiftwidth=2
"set autoindent
"set smartindent
"set smarttab
set cindent

" ------------------------------------------------------------------------------
" 80 lines
" ------------------------------------------------------------------------------

set textwidth=80
set cc=+1
highlight OverLength ctermfg=red guibg=#592929
match OverLength /\%81v.\+/

" ------------------------------------------------------------------------------
" Cursor
" ------------------------------------------------------------------------------

" Set cursor line
set cursorline
set nocursorcolumn

" Change the cursor shape
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" ------------------------------------------------------------------------------
" Line Numbers
" ------------------------------------------------------------------------------

set number
set relativenumber

" ------------------------------------------------------------------------------
" Configuration
" ------------------------------------------------------------------------------

" Edit vimr configuration file
nnoremap <Leader>e :e $MYVIMRC<CR>
" Watch changes on this file
augroup myvimrchooks
  au!
  autocmd BufWritePost ~/.config/nvim/init.vim :so $MYVIMRC
augroup end

" ------------------------------------------------------------------------------
" Hidden Chars
" ------------------------------------------------------------------------------

set list
set lcs=eol:¬

" ------------------------------------------------------------------------------
" Custom Shortcuts
" ------------------------------------------------------------------------------



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

" Prettier
" https://github.com/prettier/vim-prettier
" ------------------------------------------------------------------------------

Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Ale
" https://github.com/dense-analysis/ale
" ------------------------------------------------------------------------------

Plug 'dense-analysis/ale'

" Grubvox
" https://github.com/morhetz/gruvbox
" ------------------------------------------------------------------------------

Plug 'morhetz/gruvbox'

" Fuzzy file finder
" https://github.com/junegunn/fzf.vim
" https://github.com/yuki-ycino/fzf-preview.vim
" ------------------------------------------------------------------------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'

" NERDTree
" https://github.com/preservim/nerdtree
" https://github.com/Xuyuanp/nerdtree-git-plugin
" https://github.com/tpope/vim-vinegar
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
" ------------------------------------------------------------------------------

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-vinegar'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" yast.vim
" https://github.com/othree/yajs.vim
" ------------------------------------------------------------------------------
Plug 'othree/yajs.vim' " TS Syntax

" vim-styled-components
" https://github.com/styled-components/vim-styled-components
" ------------------------------------------------------------------------------
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" further
" https://github.com/PsychoLlama/further.vim
" ------------------------------------------------------------------------------

Plug 'PsychoLlama/further.vim'

" indentline
" https://github.com/Yggdroot/indentLine
" ------------------------------------------------------------------------------

Plug 'yggdroot/indentline'

" vim-signature
" https://github.com/kshenoy/vim-signature
" ------------------------------------------------------------------------------

Plug 'kshenoy/vim-signature'

" markdown-preview
" https://github.com/iamcco/markdown-preview.nvim
" ------------------------------------------------------------------------------

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Surround
" https://github.com/tpope/vim-surround
" ------------------------------------------------------------------------------

Plug 'tpope/vim-surround'

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

" airline
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" ------------------------------------------------------------------------------

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

" airline
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" ------------------------------------------------------------------------------

let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='gruvbox'

" Always show status line
set laststatus=2

" fugitive
" https://github.com/tpope/vim-fugitive
" https://github.com/airblade/vim-gitgutter
" https://github.com/gregsexton/gitv
" ------------------------------------------------------------------------------

nnoremap <Leader>gg :G<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Gpush<CR>

" NERDTree
" https://github.com/preservim/nerdtree
" https://github.com/Xuyuanp/nerdtree-git-plugin
" https://github.com/tpope/vim-vinegar
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
" ------------------------------------------------------------------------------

"inoremap jk <ESC>
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
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

" fzf
" https://github.com/junegunn/fzf.vim
" https://github.com/yuki-ycino/fzf-preview.vim
" ------------------------------------------------------------------------------

nnoremap <C-p> :FzfPreviewProjectFiles<CR>
nnoremap <Leader>b :Buffers<CR>

" polyglot
" https://github.com/sheerun/vim-polyglot
" ------------------------------------------------------------------------------

let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0

" prettier
" https://github.com/prettier/vim-prettier
" ------------------------------------------------------------------------------

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.md PrettierAsync

" nerdcommenter
" ------------------------------------------------------------------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" coc
" https://github.com/neoclide/coc.nvim
" ------------------------------------------------------------------------------

set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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


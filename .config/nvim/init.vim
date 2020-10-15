"  __________
" < vim.init >
"  ----------
"       \                    / \  //\
"        \    |\___/|      /   \//  \\
"             /0  0  \__  /    //  | \ \
"            /     /  \/_/    //   |  \  \
"            @_^_@'/   \/_   //    |   \   \
"            //_^_/     \/_ //     |    \    \
"         ( //) |        \///      |     \     \
"       ( / /) _|_ /   )  //       |      \     _\
"     ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
"   (( / / )) ,-{        _      `-.|.-~-.           .~         `.
"  (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
"  (( /// ))      `.   {            }                   /      \  \
"   (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
"              ///.----..>        \             _ -~             `.  ^-`  ^-_
"                ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
"                                                                   /.-~

" No comments added
" Press <S-K> on any command to see documentation

" ==============================================================================
" plugins
" ==============================================================================

call plug#begin()

" autocompletion
" ------------------------------------------------------------------------------

" Plug 'neoclide/coc.nvim', {'branch': 'release'} " https://github.com/neoclide/coc.nvim
Plug 'RishabhRD/nvim-lsputils'
Plug 'RishabhRD/popfix'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " https://github.com/honza/vim-snippets

" highlighting & colors
" ------------------------------------------------------------------------------

" Plug 'sheerun/vim-polyglot' " https://github.com/sheerun/vim-polyglot
" Plug 'gruvbox-community/gruvbox' " https://github.com/gruvbox-community/gruvbox
Plug 'sainnhe/gruvbox-material'
" Plug 'phanviet/vim-monokai-pro'
Plug 'itchyny/lightline.vim' " https://github.com/itchyny/lightline.vim
Plug 'nvim-treesitter/nvim-treesitter'

" file management
" ------------------------------------------------------------------------------

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " https://github.com/junegunn/fzf.vim
" Plug 'antoinemadec/coc-fzf' " https://github.com/antoinemadec/coc-fzf
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " https://github.com/iamcco/markdown-preview.nvim
Plug 'justinmk/vim-dirvish'

" ------------------------------------------------------------------------------

Plug 'preservim/nerdcommenter' " https://github.com/preservim/nerdcommenter
Plug 'janko/vim-test' " https://github.com/janko/vim-test
Plug 'tpope/vim-dispatch'
" Plug 'antoinemadec/FixCursorHold.nvim' " https://github.com/antoinemadec/FixCursorHold.nvim
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
" Plug 'vuciv/vim-bujo'

" vcs
" ------------------------------------------------------------------------------

Plug 'tpope/vim-fugitive' " https://github.com/tpope/vim-fugitive
Plug 'mhinz/vim-signify' " https://github.com/mhinz/vim-signify
Plug 'stsewd/fzf-checkout.vim' " https://github.com/stsewd/fzf-checkout.vim

call plug#end()

source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/gruvbox.vim
source $HOME/.config/nvim/lightline.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/fugitive.vim
source $HOME/.config/nvim/nerdcommenter.vim
" source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/dirvish.vim
source $HOME/.config/nvim/prettier.vim

lua require("treesitter")
lua require("lsp")
" autocmd BufWritePost * lua vim.lsp.buf.formatting()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

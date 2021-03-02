--
-- general
-- 

vim.o.showmode = false

vim.o.path = ".,**"
vim.o.encoding = "UTF-8"
vim.g.mapleader = ','

-- vim.cmd("set clipboard+=unnamedplus")
vim.o.clipboard = "unnamedplus"

vim.o.hidden = true
vim.o.updatetime = 100
vim.o.timeoutlen = 600
vim.o.signcolumn = 'yes'

-- Avoid showing message extra message when using completion
-- vim.cmd("set shortmess+=c")
vim.o.shortmess = "c"

--
-- scroll
--

vim.o.scrolloff = 4
vim.o.lazyredraw = true

--
-- backup files
--

vim.o.backup = false
vim.o.swapfile = false

-- 
-- folding
--

vim.wo.foldmethod = "expr"
vim.wo.foldenable = false
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

--
-- indentation
--

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.autoindent = true

--
-- 80 lines
--

vim.o.textwidth = 80
vim.o.colorcolumn = "80,120"
vim.o.wrap = false
vim.o.smartcase = true

--
-- cursor
--

vim.o.cursorline = true

--
-- line numbers
--

vim.o.relativenumber = true

--
-- vimrc
--

-- Edit vimrc configuration file
vim.cmd("nnoremap <Leader>e :e $MYVIMRC<CR>")

--
-- images & pdf
-- 

vim.cmd('autocmd bufenter *.png,*.jpg,*.jpeg,*.gif exec "!imv \'".expand("%")."\' &" | :bd')
vim.cmd('autocmd bufenter *.pdf exec "!zathura \'".expand("%")."\' &" | :bw')

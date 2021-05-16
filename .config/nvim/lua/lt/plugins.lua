-- Install the packer if not yet
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

  --
  -- lsp
  --

  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'
  use 'tjdevries/nlua.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/nvim-compe'
  use 'nvim-lua/completion-nvim' -- https://github.com/nvim-lua/completion-nvim
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets' -- https://github.com/honza/vim-snippets

  -- Theme
  use 'folke/tokyonight.nvim'

  -- Line
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  --
  -- file management
  --

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' } -- https://github.com/iamcco/markdown-preview.nvim
  use 'tpope/vim-vinegar' -- https://github.com/tpope/vim-vinegar

  -- ---------------------------------------------------------------------------

  -- Comments
  use 'terrortylor/nvim-comment'
  require('nvim_comment').setup()

  -- Pears
  use 'steelsojka/pears.nvim'
  require('pears').setup()

  -- Indent Guides
  -- use 'glepnir/indent-guides.nvim'
  -- require('indent_guides').setup()

  -- use 'tpope/vim-dispatch'
  use 'vimwiki/vimwiki' -- https://github.com/vimwiki/vimwiki
  use 'tpope/vim-surround' -- https://github.com/tpope/vim-surround
  use 'brooth/far.vim' -- https://github.com/brooth/far.vim
  use 'ojroques/nvim-bufdel' -- https://github.com/ojroques/nvim-bufdel
  use 'mhinz/vim-startify' -- https://github.com/mhinz/vim-startify
  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup {} end
  }

  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end
  }

  --
  -- test & debug
  --

  use 'vim-test/vim-test' -- https://github.com/vim-test/vim-test
  use 'mfussenegger/nvim-dap'
  -- use 'szw/vim-maximizer'
  use 'akinsho/nvim-toggleterm.lua'

  --
  -- vcs
  --

  use 'tpope/vim-fugitive' -- https://github.com/tpope/vim-fugitive
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end
  }
  use 'rhysd/git-messenger.vim' -- https://github.com/rhysd/git-messenger.vim
  use 'f-person/git-blame.nvim' -- https://github.com/f-person/git-blame.nvim
end)


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

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'anott03/nvim-lspinstall'
  use 'tjdevries/nlua.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'hrsh7th/nvim-compe'

  -- snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets' -- https://github.com/honza/vim-snippets

  -- theme
  use 'folke/tokyonight.nvim'

  -- line
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end
  }

  -- fzf
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- markdown preview
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' } -- https://github.com/iamcco/markdown-preview.nvim

  -- file manager
  use 'tpope/vim-vinegar' -- https://github.com/tpope/vim-vinegar

  -- Comments
  use 'terrortylor/nvim-comment'
  require('nvim_comment').setup()

  -- Pears
  use 'steelsojka/pears.nvim'
  require('pears').setup()

  -- wiki
  use 'vimwiki/vimwiki' -- https://github.com/vimwiki/vimwiki

  -- sorround
  use 'tpope/vim-surround' -- https://github.com/tpope/vim-surround

  -- colors
  use 'norcalli/nvim-colorizer.lua' -- https://github.com/norcalli/nvim-colorizer.lua

  -- multi edition
  use 'brooth/far.vim' -- https://github.com/brooth/far.vim

  -- buffers
  use 'ojroques/nvim-bufdel' -- https://github.com/ojroques/nvim-bufdel

  -- dashboard
  use 'mhinz/vim-startify' -- https://github.com/mhinz/vim-startify

  -- wich key
  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup {} end
  }

  -- test
  use 'vim-test/vim-test' -- https://github.com/vim-test/vim-test

  -- debug
  use 'mfussenegger/nvim-dap'
  -- use 'szw/vim-maximizer'

  -- term
  use 'akinsho/nvim-toggleterm.lua'

  -- vcs
  use 'tpope/vim-fugitive' -- https://github.com/tpope/vim-fugitive
  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('gitsigns').setup() end
  }
  use 'rhysd/git-messenger.vim' -- https://github.com/rhysd/git-messenger.vim
  use 'f-person/git-blame.nvim' -- https://github.com/f-person/git-blame.nvim
end)


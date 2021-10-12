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
  use 'tjdevries/nlua.nvim'
  use 'glepnir/lspsaga.nvim'
  use 'nvim-lua/lsp-status.nvim'
  use 'hrsh7th/nvim-compe' --completion
  -- use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}

  -- formatter
  use 'mhartington/formatter.nvim' -- https://github.com/mhartington/formatter.nvim

  -- snippets
  -- use 'SirVer/ultisnips' -- https://github.com/sirver/UltiSnips
  -- use 'honza/vim-snippets' -- https://github.com/honza/vim-snippets
  use 'norcalli/snippets.nvim' -- https://github.com/norcalli/snippets.nvim

  -- theme
  use 'folke/tokyonight.nvim'

  -- line
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use {
    'lewis6991/spellsitter.nvim',
    config = function()
      require('spellsitter').setup()
    end
  }

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- markdown preview
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' } -- https://github.com/iamcco/markdown-preview.nvim

  -- file manager
  use 'tpope/vim-vinegar' -- https://github.com/tpope/vim-vinegar

  -- comments
  use 'terrortylor/nvim-comment'
  require('nvim_comment').setup()

  -- pears
  use 'steelsojka/pears.nvim'
  require('pears').setup()

  -- wiki
  use 'vimwiki/vimwiki' -- https://github.com/vimwiki/vimwiki

  -- surround
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
  use 'nvim-telescope/telescope-dap.nvim'
  -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

  -- term
  use 'akinsho/nvim-toggleterm.lua'

  -- vcs
  use 'tpope/vim-fugitive' -- https://github.com/tpope/vim-fugitive
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use 'rhysd/git-messenger.vim' -- https://github.com/rhysd/git-messenger.vim
  use 'f-person/git-blame.nvim' -- https://github.com/f-person/git-blame.nvim

  -- others
  use 'edluffy/specs.nvim' -- https://github.com/edluffy/specs.nvim
  use 'nacro90/numb.nvim' -- https://github.com/nacro90/numb.nvim
  use 'godlygeek/tabular' -- 
  use 'simrat39/rust-tools.nvim'
end)


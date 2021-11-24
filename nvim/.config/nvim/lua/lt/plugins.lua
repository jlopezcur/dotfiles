-- Install the packer if not yet
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

vim.cmd [[packadd packer.nvim]]
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require("packer").startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    -- lsp
    use "neovim/nvim-lspconfig"
    use "tjdevries/nlua.nvim"
    use "glepnir/lspsaga.nvim"
    use "nvim-lua/lsp-status.nvim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    use "onsails/lspkind-nvim"
    use "f3fora/cmp-spell"

    -- formatter
    use "mhartington/formatter.nvim" -- https://github.com/mhartington/formatter.nvim

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- theme
    use "folke/tokyonight.nvim"

    -- line
    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "rcarriga/nvim-notify"

    -- treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/playground"
    use {
      "lewis6991/spellsitter.nvim",
      config = function()
        require("spellsitter").setup()
      end
    }

    -- fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }

    -- markdown preview
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"} -- https://github.com/iamcco/markdown-preview.nvim

    -- file manager
    use "tpope/vim-vinegar" -- https://github.com/tpope/vim-vinegar

    -- comments
    -- https://github.com/numToStr/Comment.nvim
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end
    }

    -- pears
    use "steelsojka/pears.nvim"
    require("pears").setup()

    -- wiki
    use "vimwiki/vimwiki" -- https://github.com/vimwiki/vimwiki

    -- surround
    use "tpope/vim-surround" -- https://github.com/tpope/vim-surround

    -- colors
    use "norcalli/nvim-colorizer.lua" -- https://github.com/norcalli/nvim-colorizer.lua

    -- multi edition
    -- https://github.com/brooth/far.vim
    use "brooth/far.vim"

    -- buffers
    -- https://github.com/ojroques/nvim-bufdel
    use "ojroques/nvim-bufdel"

    -- dashboard
    -- use 'mhinz/vim-startify' -- https://github.com/mhinz/vim-startify
    -- https://github.com/goolord/alpha-nvim
    use {
      "goolord/alpha-nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require "alpha".setup(require "alpha.themes.startify".opts)
      end
    }

    -- wich key
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }

    -- test
    use "vim-test/vim-test" -- https://github.com/vim-test/vim-test
    -- use { -- https://github.com/rcarriga/vim-ultest
    --   "rcarriga/vim-ultest",
    --   requires = {"vim-test/vim-test"},
    --   run = ":UpdateRemotePlugins"
    -- }

    -- debug
    use "mfussenegger/nvim-dap"
    use "nvim-telescope/telescope-dap.nvim"
    -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- term
    use "akinsho/nvim-toggleterm.lua"

    -- vcs
    use "tpope/vim-fugitive" -- https://github.com/tpope/vim-fugitive
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }
    use "rhysd/git-messenger.vim" -- https://github.com/rhysd/git-messenger.vim
    use "f-person/git-blame.nvim" -- https://github.com/f-person/git-blame.nvim

    -- others
    use "edluffy/specs.nvim" -- https://github.com/edluffy/specs.nvim
    use "nacro90/numb.nvim" -- https://github.com/nacro90/numb.nvim
    use "godlygeek/tabular" --
    use "simrat39/rust-tools.nvim"

    -- arduino
    use "stevearc/vim-arduino" -- https://github.com/stevearc/vim-arduino
  end
)

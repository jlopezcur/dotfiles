-- Install the packer if not yet
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

vim.cmd [[packadd packer.nvim]]
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require "packer".startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    -- lsp
    use {
      "neovim/nvim-lspconfig", -- https://github.com/neovim/nvim-lspconfig
      "williamboman/nvim-lsp-installer" -- https://github.com/williamboman/nvim-lsp-installer/
    }
    use "tjdevries/nlua.nvim"
    use "nvim-lua/lsp-status.nvim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    use "onsails/lspkind-nvim"
    use "f3fora/cmp-spell"
    use "b0o/schemastore.nvim" -- https://github.com/b0o/SchemaStore.nvim
    use "folke/lsp-colors.nvim" -- https://github.com/folke/lsp-colors.nvim

    -- diagnostic
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "trouble".setup {}
      end
    }

    -- formatter
    use "mhartington/formatter.nvim" -- https://github.com/mhartington/formatter.nvim

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "mattn/emmet-vim" -- https://github.com/mattn/emmet-vim

    -- theme
    use "EdenEast/nightfox.nvim"
    use "savq/melange" -- https://github.com/savq/melange
    use "rmehri01/onenord.nvim" -- https://github.com/rmehri01/onenord.nvim
    use "folke/tokyonight.nvim" -- https://github.com/folke/tokyonight.nvim

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
        require "spellsitter".setup()
      end
    }

    -- file manager
    -- fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-fzy-native.nvim"}}
    }
    use "tpope/vim-vinegar" -- https://github.com/tpope/vim-vinegar
    -- use "SidOfc/carbon.nvim" -- https://github.com/SidOfc/carbon.nvim
    use "cljoly/telescope-repo.nvim" -- https://github.com/cljoly/telescope-repo.nvim
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require "neoclip".setup()
      end
    }
    -- https://github.com/ThePrimeagen/harpoon
    use {
      "ThePrimeagen/harpoon",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    use "tpope/vim-repeat" -- https://github.com/tpope/vim-repeat
    use "ggandor/lightspeed.nvim" -- https://github.com/ggandor/lightspeed.nvim

    -- markdown preview
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"} -- https://github.com/iamcco/markdown-preview.nvim

    -- comments
    -- https://github.com/numToStr/Comment.nvim
    use {
      "numToStr/Comment.nvim",
      config = function()
        require "Comment".setup()
      end
    }

    -- pears
    use "steelsojka/pears.nvim"
    require "pears".setup()

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
    use {
      "goolord/alpha-nvim", -- https://github.com/goolord/alpha-nvim
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    -- wich key
    use {
      "folke/which-key.nvim",
      config = function()
        require "which-key".setup {}
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
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}

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
    use {"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"} -- https://github.com/sindrets/diffview.nvim

    -- others
    use "nacro90/numb.nvim" -- https://github.com/nacro90/numb.nvim
    use "godlygeek/tabular" --
    use "simrat39/rust-tools.nvim"
    use {
      "folke/zen-mode.nvim", -- https://github.com/folke/zen-mode.nvim
      config = function()
        require "zen-mode".setup {}
      end
    }

    -- dependencies
    -- use(
    --   {
    --     "vuki656/package-info.nvim",
    --     requires = "MunifTanjim/nui.nvim"
    --   }
    -- )

    -- keymapping more easy
    use "b0o/mapx.nvim" -- https://github.com/b0o/mapx.nvim
  end
)

--
-- Configuration
--

local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    prompt_prefix = " ﮊ ",
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      ignore_current_buffer = true
      -- theme = "dropdown"
    },
    git_branches = {
      sort_lastused = true
    }
  }
}

require "telescope".load_extension "repo"
require "telescope".load_extension "neoclip"
require "telescope".load_extension "fzy_native"

--
-- Mappings
--

-- Files
vim.keymap.set("n", "<leader>ff", require "telescope.builtin".find_files)
vim.keymap.set("n", "<leader>fg", require "telescope.builtin".live_grep)
vim.keymap.set("n", "<leader>fb", require "telescope.builtin".buffers)
vim.keymap.set("n", "<leader>fh", require "telescope.builtin".help_tags)

-- LSP
vim.keymap.set("n", "gr", require "telescope.builtin".lsp_references)

-- Git
-- Remember: Ctrl-a create a new brnach, Ctrl-d remove selected branch
vim.keymap.set("n", "<leader>gb", require "telescope.builtin".git_branches)
vim.keymap.set("n", "<leader>gc", require "telescope.builtin".git_bcommits)
vim.keymap.set("n", "<leader>gt", require "telescope.builtin".git_stash)

-- Repo List
vim.keymap.set("n", "<leader>rl", ":Telescope repo list<CR>")

-- Neoclip
vim.keymap.set("n", "<leader>yl", ":Telescope neoclip<CR>")

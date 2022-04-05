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

require "user.telescope.mappings"

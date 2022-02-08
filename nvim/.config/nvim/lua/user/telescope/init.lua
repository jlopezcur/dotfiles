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
    },
    git_branches = {
      sort_lastused = true
    },
    buffers = {
      sort_lastused = true,
      ignore_current_buffer = true,
      theme = "dropdown"
    }
  }
}

require "telescope".load_extension "repo"
require "telescope".load_extension "neoclip"

require "user.telescope.mappings"

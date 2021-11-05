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
      sort_lastused = true,
      ignore_current_buffer = true
    }
    -- find_files = {
    --   theme = "dropdown"
    -- }
  }
}

require("telescope").load_extension("fzy_native")

require "lt.telescope.mappings"


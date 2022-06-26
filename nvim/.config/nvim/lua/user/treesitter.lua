--
-- Configuration
--

require "nvim-treesitter.configs".setup {
  context_commentstring = {enable = true},
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  },
  indent = {enable = false},
  autotag = {enable = true},
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?"
    }
  }
}

--
-- Mappings
--

vim.keymap.set("n", "<Leader>tp", ":TSPlaygroundToggle<CR>")

--
-- Custom
--

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.mdx = {
  install_info = {
    url = "~/tree-sitter/tree-sitter-mdx", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "mdx" -- if filetype does not agrees with parser name
}

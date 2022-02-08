local alpha = require("alpha")
local theme = require("alpha.themes.startify")

theme.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                           by Kloder "
}

theme.opts.layout = {
  {type = "padding", val = 1},
  theme.section.header,
  {type = "padding", val = 2},
  theme.section.top_buttons,
  {
    type = "group",
    val = {
      {type = "padding", val = 1},
      {type = "text", val = "MRU " .. vim.fn.getcwd(), opts = {hl = "SpecialComment", shrink_margin = false}},
      {type = "padding", val = 1},
      {
        type = "group",
        val = function()
          return {theme.mru(1, vim.fn.getcwd())}
        end,
        opts = {shrink_margin = false}
      }
    }
  },
  {
    type = "group",
    val = {
      {type = "padding", val = 1},
      {type = "text", val = "MRU", opts = {hl = "SpecialComment"}},
      {type = "padding", val = 1},
      {
        type = "group",
        val = function()
          return {theme.mru(10)}
        end
      }
    }
  },
  {type = "padding", val = 1},
  theme.section.bottom_buttons,
  theme.section.footer
}

alpha.setup(theme.opts)

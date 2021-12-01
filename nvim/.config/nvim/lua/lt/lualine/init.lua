local fmt = function(str)
  if str == "V-BLOCK" then
    return "V-B"
  end
  return str:sub(1, 1)
end

require("lualine").setup(
  {
    options = {
      theme = "tokyonight"
    },
    extensions = {
      "fugitive",
      "quickfix",
      "toggleterm"
    },
    sections = {
      lualine_a = {
        {"mode", fmt = fmt}
      },
      lualine_b = {
        "branch",
        {
          "diff",
          diff_color = {
            -- Same values like general color option can be used here.
            added = {fg = "#b9f27c"}, -- changes diff's added color
            modified = {fg = "#FF9E64"}, -- changes diff's modified color
            removed = {fg = "#F7768E"} -- changes diff's removed color you
          }
        },
        {"diagnostics", sources = {"nvim_lsp"}},
        "require('package-info').get_status()"
      },
      lualine_c = {"filename"},
      -- {"filename", path = 1},
      lualine_x = {"encoding", "fileformat", "filetype"},
      lualine_y = {"progress"},
      lualine_z = {"location"}
    }
  }
)

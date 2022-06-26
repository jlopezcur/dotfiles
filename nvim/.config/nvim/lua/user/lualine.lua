--
-- Configuration
--

local fmt = function(str)
  if str == "V-BLOCK" then
    return "V-B"
  end
  return str:sub(1, 1)
end

require("lualine").setup(
  {
    options = {
      theme = "tokyonight",
      component_separators = "|",
      section_separators = {left = "", right = ""}
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
        "filename"
      },
      lualine_c = {
        {
          "diff",
          diff_color = {
            -- Same values like general color option can be used here.
            added = {fg = "#b9f27c"}, -- changes diff's added color
            modified = {fg = "#FF9E64"}, -- changes diff's modified color
            removed = {fg = "#F7768E"} -- changes diff's removed color you
          }
        },
        {"diagnostics", sources = {"nvim_diagnostic"}}
      },
      -- {"filename", path = 1},
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype"
      },
      lualine_y = {"progress"},
      lualine_z = {
        {"location"}
      }
    },
    inactive_sections = {
      lualine_a = {"filename"},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {"location"}
    }
  }
)

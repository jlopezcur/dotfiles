require('lualine').setup({
  options = {
    theme = 'gruvbox_material'
  },
  extensions = {
    'fugitive'
  },
  -- sections = {
  --   lualine_c = {
  --     {
  --       'filename',
  --       file_status = true,
  --       full_path = true,
  --       shorten = false
  --     }
  --   }
  -- }
})

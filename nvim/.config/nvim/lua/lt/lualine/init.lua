require('lualine').setup({
  options = { theme = 'tokyonight' },
  extensions = {
    'fugitive',
    'quickfix',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'diagnostic',
        sources = {'nvim_lsp'},
        symbols = {
          error = '',
          warn = '',
          info = '',
        }
      },
      {
        'filename',
        path = 1
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  }
})

require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,
  -- preselect = 'enable' || 'disable' || 'always';
  -- throttle_time = ... number ...;
  -- source_timeout = ... number ...;
  -- incomplete_delay = ... number ...;
  -- allow_prefix_unmatch = false;

  source = {
    ultisnips = {
      filetypes = {
        'markdown',
        'json',
        'yaml',
        'css',
        'scss',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'typescript.tsx',
        'rust'
      },
      sticky_char = '0'
    },
    nvim_lua = { 'lua' },
    nvim_lsp = {
      filetypes = {
        'markdown',
        'json',
        'yaml',
        'css',
        'scss',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'typescript.tsx',
        'rust'
      }
    },
    path = true,
    buffer =  true,
  }
}

-- commented options are defaults
require('lspkind').init({
    with_text = true,
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})


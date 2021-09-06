require'compe'.setup {
  enabled = true,
  debug = false,
  min_length = 1,
  -- preselect = 'enable' || 'disable' || 'always';
  preselect = 'enable',
  -- throttle_time = ... number ...;
  throttle_time = 80,
  -- source_timeout = ... number ...;
  source_timeout = 200,
  -- incomplete_delay = ... number ...;
  incomplete_delay = 400,

  source = {
    -- tabnine = true,
    -- ultisnips = true,
    snippets_nvim = true,
    nvim_lsp = true,
    nvim_lua = true,
    path = true,
    buffer = true,
  }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('i', '<C-Space>', "<cmd>call compe#complete()<CR>", opts)
vim.api.nvim_set_keymap('i', '<CR>', "<cmd>call compe#confirm('<CR>')<CR>", opts)
vim.api.nvim_set_keymap('i', '<C-e>', "<cmd>call compe#close('<C-e>')<CR>", opts)
vim.api.nvim_set_keymap('i', '<C-f>', "<cmd>call compe#scroll({ 'delta': +4 })<CR>", opts)
vim.api.nvim_set_keymap('i', '<C-d>', "<cmd>call compe#scroll({ 'delta': -4 })<CR>", opts)

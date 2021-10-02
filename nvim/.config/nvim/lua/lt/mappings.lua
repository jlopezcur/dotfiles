options = { noremap = true, silent = true }

-- Change require into import
vim.api.nvim_set_keymap('n', '<Leader>qf', "<cmd>_ciwimportf=dwdwifrom lx$hxj", options)

-- _ciwimportf=dwdwifrom lx$hxj
vim.api.nvim_set_keymap('n', '<Leader>rr', ':TermExec cmd="cargo run" go_back=0 direction=vertical size=80<cr>', options)

-- close a buffer
vim.api.nvim_set_keymap('n', '<Leader>gq', "<cmd>:BufDel<CR>", options)

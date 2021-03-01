options = {noremap=true, silent=true}

vim.api.nvim_set_keymap('n', '<Leader>gq', "<cmd>:bd!<CR>", options)
vim.api.nvim_set_keymap('t', '<Leader><Esc>', "<C-\\><C-n>", options)

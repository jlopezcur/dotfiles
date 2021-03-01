local map = vim.api.nvim_set_keymap

options = { noremap = true }
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", options)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", options)
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", options)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", options)

map('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", options)
map('n', '<leader>fB', "<cmd>lua require('telescope.builtin').git_branches()<CR>", options)
-- map('n', '<leader>gs', "<cmd>lua require('telescope.builtin').git_status()<CR>", options)

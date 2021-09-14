local map = vim.api.nvim_set_keymap
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    prompt_prefix = ' ﮊ ',
  },
}

local opts = { noremap = true, silent = true }
map('n', '<leader>ff', "<cmd>lua require('lt.telescope.project_picker').project_files()<CR>", opts)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
map('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<CR>", opts)
map('n', '<leader>fr', "<cmd>lua require('telescope.builtin').registers()<CR>", opts)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)

map('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
-- Remember: Ctrl-a create a new brnach, Ctrl-d remove selected branch
map('n', '<leader>gb', "<cmd>lua require('telescope.builtin').git_branches({ sort_lastused = true, ignore_current_buffer = true })<CR>", opts)
map('n', '<leader>gc', "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", opts)
-- map('n', '<leader>gs', "<cmd>lua require('telescope.builtin').git_status()<CR>", opts)

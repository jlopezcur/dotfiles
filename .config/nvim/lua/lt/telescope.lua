local actions = require('telescope.actions')
local map = vim.api.nvim_set_keymap

require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' ﮊ ',

    flie_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require('telescope').load_extension('fzy_native')

options = { noremap = true }
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", options)
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", options)
map('n', '<leader>b', "<cmd>lua require('telescope.builtin').buffers()<CR>", options)
map('n', '<leader>r', "<cmd>lua require('telescope.builtin').registers()<CR>", options)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<CR>", options)

map('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", options)
map('n', '<leader>gb', "<cmd>lua require('telescope.builtin').git_branches()<CR>", options)
map('n', '<leader>gc', "<cmd>lua require('telescope.builtin').git_bcommits()<CR>", options)
-- map('n', '<leader>gs', "<cmd>lua require('telescope.builtin').git_status()<CR>", options)
map('n', '<leader>rc', "<cmd>lua require('telescope.builtin').find_files({ cwd = '~/dev/dotfiles/.config/'})<CR>", options)
map('n', '<leader>d', "<cmd>lua require('telescope.builtin').find_files({ cwd = '~/dev/', file_ignore_patterns = { 'node_modules' } })<CR>", options)

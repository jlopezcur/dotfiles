-- Files
vim.keymap.set("n", "<leader>ff", require "telescope.builtin".find_files)
vim.keymap.set("n", "<leader>fg", require "telescope.builtin".live_grep)
vim.keymap.set("n", "<leader>fb", require "telescope.builtin".buffers)
vim.keymap.set("n", "<leader>fh", require "telescope.builtin".help_tags)

-- LSP
vim.keymap.set("n", "gr", require "telescope.builtin".lsp_references)

-- Git
-- Remember: Ctrl-a create a new brnach, Ctrl-d remove selected branch
vim.keymap.set("n", "<leader>gb", require "telescope.builtin".git_branches)
vim.keymap.set("n", "<leader>gc", require "telescope.builtin".git_bcommits)
vim.keymap.set("n", "<leader>gt", require "telescope.builtin".git_stash)

-- Repo List
vim.keymap.set("n", "<leader>rl", ":Telescope repo list<CR>")

-- Neoclip
vim.keymap.set("n", "<leader>yl", ":Telescope neoclip<CR>")

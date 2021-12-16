local opts = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

-- Files
map("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files{}<CR>", opts)
map("n", "<leader>fg", "<cmd>lua require'telescope.builtin'.live_grep{}<CR>", opts)
map("n", "<leader>fb", "<cmd>lua require'telescope.builtin'.buffers{}<CR>", opts)
map("n", "<leader>fh", "<cmd>lua require'telescope.builtin'.help_tags{}<CR>", opts)

-- LSP
map("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>", opts)

-- Git
-- Remember: Ctrl-a create a new brnach, Ctrl-d remove selected branch
map("n", "<leader>gb", "<cmd>lua require'telescope.builtin'.git_branches{}<CR>", opts)
map("n", "<leader>gc", "<cmd>lua require'telescope.builtin'.git_bcommits{}<CR>", opts)
map("n", "<leader>gt", "<cmd>lua require'telescope.builtin'.git_stash{}<CR>", opts)

-- Repo List
map("n", "<leader>rl", "<cmd>Telescope repo list<CR>", opts)

-- Neoclip
map("n", "<leader>yl", "<cmd>Telescope neoclip<CR>", opts)


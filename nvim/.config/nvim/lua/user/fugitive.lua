--
-- Mappings
--

-- Git status
vim.keymap.set("n", "<Leader>gs", "<cmd>:G<CR>")

-- Git push
vim.keymap.set("n", "<Leader>gp", "<cmd>:Git push<CR>")

-- Git pull
vim.keymap.set("n", "<Leader>gl", "<cmd>:Git pull<CR>")

-- Go to previous git change
vim.keymap.set("n", "[q", "<cmd>:cprev<CR>")

-- Go to next git change
vim.keymap.set("n", "]q", "<cmd>:cnext<CR>")

-- Go to first git change
vim.keymap.set("n", "[Q", "<cmd>:cfirst<CR>")

-- Go to last git change
vim.keymap.set("n", "]Q", "<cmd>:clast<CR>")

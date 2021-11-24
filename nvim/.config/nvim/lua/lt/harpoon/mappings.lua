local opts = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

map("n", "<space>h", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>", opts)
map("n", "<space>j", "<cmd>lua require'harpoon.ui'.nav_file(1)<CR>", opts)
map("n", "<space>k", "<cmd>lua require'harpoon.ui'.nav_file(2)<CR>", opts)
map("n", "<space>l", "<cmd>lua require'harpoon.ui'.nav_file(3)<CR>", opts)
map("n", "<space>;", "<cmd>lua require'harpoon.ui'.nav_file(4)<CR>", opts)
map("n", "<space>m", "<cmd>lua require'harpoon.mark'.add_file()<CR>", opts)

local opts = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

map("n", "<space>hh", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>", opts)
map("n", "<space>ha", "<cmd>lua require'harpoon.ui'.nav_file(1)<CR>", opts)
map("n", "<space>hs", "<cmd>lua require'harpoon.ui'.nav_file(2)<CR>", opts)
map("n", "<space>hd", "<cmd>lua require'harpoon.ui'.nav_file(3)<CR>", opts)
map("n", "<space>hf", "<cmd>lua require'harpoon.ui'.nav_file(4)<CR>", opts)
map("n", "<space>hm", "<cmd>lua require'harpoon.mark'.add_file()<CR>", opts)

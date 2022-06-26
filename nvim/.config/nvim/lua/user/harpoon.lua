require("harpoon").setup()

vim.keymap.set("n", "<space>h", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>")
vim.keymap.set("n", "<space>j", "<cmd>lua require'harpoon.ui'.nav_file(1)<CR>")
vim.keymap.set("n", "<space>k", "<cmd>lua require'harpoon.ui'.nav_file(2)<CR>")
vim.keymap.set("n", "<space>l", "<cmd>lua require'harpoon.ui'.nav_file(3)<CR>")
vim.keymap.set("n", "<space>;", "<cmd>lua require'harpoon.ui'.nav_file(4)<CR>")
vim.keymap.set("n", "<space>m", "<cmd>lua require'harpoon.mark'.add_file()<CR>")

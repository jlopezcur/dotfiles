--
-- Mappings
--

vim.keymap.set("n", "<leader>pr", ":term pio -f -c vim run<CR>i")
vim.keymap.set("n", "<leader>pu", ":term pio -f -c vim run --target upload<CR>i")
vim.keymap.set("n", "<leader>pc", ":term pio -f -c vim run --target clean<CR>i")
vim.keymap.set("n", "<leader>pp", ":term pio -f -c vim run --target program<CR>i")
vim.keymap.set("n", "<leader>pf", ":term pio -f -c vim run --target uploadfs<CR>i")
vim.keymap.set("n", "<leader>pi", ":term pio -f -c vim update<CR>i")
vim.keymap.set("n", "<leader>pt", ":term pio -f -c vim test<CR>i")

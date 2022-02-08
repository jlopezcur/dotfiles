local opts = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

map("n", "<leader>pr", ":term pio -f -c vim run<CR>i", opts)
map("n", "<leader>pu", ":term pio -f -c vim run --target upload<CR>i", opts)
map("n", "<leader>pc", ":term pio -f -c vim run --target clean<CR>i", opts)
map("n", "<leader>pp", ":term pio -f -c vim run --target program<CR>i", opts)
map("n", "<leader>pf", ":term pio -f -c vim run --target uploadfs<CR>i", opts)
map("n", "<leader>pi", ":term pio -f -c vim update<CR>i", opts)
map("n", "<leader>pt", ":term pio -f -c vim test<CR>i", opts)

local opts = {noremap = true, silent = true}
local map = vim.api.nvim_set_keymap

map("n", "<leader>au", "<cmd>ArduinoUpload<CR>", opts)
map("n", "<leader>ad", "<cmd>ArduinoUploadAndSerial<CR>", opts)
map("n", "<leader>ai", "<cmd>ArduinoInfo<CR>", opts)
map("n", "<leader>am", "<cmd>ArduinoVerify<CR>", opts)

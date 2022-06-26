--
-- Configuration
--

require "gitsigns".setup {}

--
-- Mappings
--

-- Preview hunk
vim.keymap.set("n", "<Leader>gh", "<cmd>:Gitsigns preview_hunk<CR>", {desc = "Preview hunk"})

-- Reset hunk
vim.keymap.set("n", "<Leader>gr", "<cmd>:Gitsigns reset_hunk<CR>", {desc = "Reset hunk"})

-- Blame line
vim.keymap.set("n", "<Leader>bl", "<cmd>:Gitsigns blame_line<CR>", {desc = "Blame line"})

local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

--
-- Commands
--

-- Git status
map('n', '<Leader>gs', "<cmd>:G<CR>", options)

-- Git push
map('n', '<Leader>gp', "<cmd>:Git push<CR>", options)

--
-- Movements
--

-- Go to previous git change
map('n', '[q', "<cmd>:cprev<CR>", options)

-- Go to next git change
map('n', ']q', "<cmd>:cnext<CR>", options)

-- Go to first git change
map('n', '[Q', "<cmd>:cfirst<CR>", options)

-- Go to last git change
map('n', ']Q', "<cmd>:clast<CR>", options)

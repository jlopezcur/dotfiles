local function set_keymap(...)
  vim.api.nvim_buf_set_keymap(vim.lsp.buf, ...)
end

local opts = {noremap = true, silent = true}

set_keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opts)
set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
set_keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
set_keymap("n", "go", "<cmd>Telescope lsp_document_symbols<CR>", opts)
set_keymap("n", "<leader>fa", "<cmd>RustCodeAction<CR>", opts)
set_keymap("v", "<leader>fa", "<cmd>RustCodeAction<CR>", opts)
set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
set_keymap("n", "<space>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

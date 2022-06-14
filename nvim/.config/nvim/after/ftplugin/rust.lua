vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
vim.keymap.set("n", "go", require("telescope.builtin").lsp_document_symbols)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("v", "ga", vim.lsp.buf.range_code_action)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<space>d", vim.diagnostic.setloclist)

-- Run rust programs
vim.keymap.set("n", "<Leader>rr", ":tabnew<CR>:term cargo run<CR>i", {buffer = true})
vim.keymap.set("n", "<Leader>rt", ":tabnew<CR>:term trunk serve<CR>i", {buffer = true})

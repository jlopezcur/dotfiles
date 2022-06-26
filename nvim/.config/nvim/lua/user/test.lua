--
-- Configuration
--

-- Use jest configuration on js environments
vim.g["test#javascript#runner"] = "jest"
vim.g["test#javascript#jest#options"] = {
  all = "--coverage",
  suite = ""
}

--
-- Mappings
--

vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>")
vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<Leader>ts", ":TestSuite<CR>")
vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>")
vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>")

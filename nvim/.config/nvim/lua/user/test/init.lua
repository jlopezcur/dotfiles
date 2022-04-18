-- Use jest configuration on js environments
vim.g["test#javascript#runner"] = "jest"
vim.g["test#javascript#jest#options"] = {
  all = "--coverage",
  suite = ""
}

-- Geneal mappings
vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>")
vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<Leader>ts", ":TestSuite<CR>")
vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>")
vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>")

-- " Storybook
-- nnoremap <Leader>ss :terminal npm start<cr>

-- " ------------------------------------------------------------------------------

-- " Python
-- autocmd FileType python nnoremap <buffer> <leader>rr :!python %<cr>

-- " Latex
-- autocmd FileType tex nnoremap <buffer> <leader>rr :!pdflatex -output-directory %:p:h %<cr>
-- autocmd FileType tex nnoremap <buffer> <leader>rb :!biber %:r<cr>
--

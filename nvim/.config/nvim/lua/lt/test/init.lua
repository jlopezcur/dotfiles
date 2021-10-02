local map = vim.api.nvim_set_keymap
options = { noremap = true, silent = true }

-- Use jest configuration on js environments
vim.g['test#javascript#runner'] = 'jest'

-- Geneal mappings
map('n', '<Leader>tn', "<cmd>:TestNearest<CR>", options)
map('n', '<Leader>tf', "<cmd>:TestFile<CR>", options)
map('n', '<Leader>ts', "<cmd>:TestSuite<CR>", options)
map('n', '<Leader>tl', "<cmd>:TestLast<CR>", options)
map('n', '<Leader>tv', "<cmd>:TestVisit<CR>", options)

-- " Storybook
-- nnoremap <Leader>ss :terminal npm start<cr>

-- " ------------------------------------------------------------------------------

-- " Python
-- autocmd FileType python nnoremap <buffer> <leader>rr :!python %<cr>

-- " Latex
-- autocmd FileType tex nnoremap <buffer> <leader>rr :!pdflatex -output-directory %:p:h %<cr>
-- autocmd FileType tex nnoremap <buffer> <leader>rb :!biber %:r<cr>
--


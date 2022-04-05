local options = {noremap = true, silent = true}

-- Change require into import
vim.api.nvim_set_keymap("n", "<Leader>qf", "<cmd>_ciwimportf=dwdwifrom lx$hxj", options)

-- tex
vim.api.nvim_set_keymap("n", "<Leader>lp", ":!pandoc -o '%:p:h/%:t:r.pdf' '%'<cr>", options)
vim.api.nvim_set_keymap("n", "<Leader>lf", ":!pdflatex '%'<cr>", options)

-- _ciwimportf=dwdwifrom lx$hxj
vim.api.nvim_set_keymap("n", "<Leader>rr", ":tabnew<cr>:term cargo run<cr>i", options)

-- close a buffer
vim.api.nvim_set_keymap("n", "<Leader>gq", "<cmd>:BufDel<CR>", options)

--
-- vimrc
--

-- Edit vimrc configuration file
vim.cmd("nnoremap <Leader>e :e $MYVIMRC<CR>")

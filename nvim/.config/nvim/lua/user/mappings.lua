-- Change require into import
vim.keymap.set("n", "<Leader>qf", "<cmd>_ciwimportf=dwdwifrom lx$hxj")

-- tex
vim.keymap.set("n", "<Leader>lp", ":!pandoc -o '%:p:h/%:t:r.pdf' '%'<CR>")
vim.keymap.set("n", "<Leader>lf", ":!pdflatex '%'<CR>")

vim.keymap.set("n", "<Leader>rr", ":tabnew<CR>:term cargo run<CR>i")

-- close a buffer
vim.keymap.set("n", "<Leader>gq", ":BufDel<CR>")

--
-- vimrc
--

-- Edit vimrc configuration file
vim.keymap.set("n", "<Leader>e", ":e ~/.config/nvim/lua/user/<CR>")

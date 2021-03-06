-- Activate spelling on md, mdx and tex files
vim.cmd("autocmd BufRead,BufNewFile *.md,*.mdx,*.tex setlocal spell spelllang=en_us,es_es")
-- Activate spelling on git commits
vim.cmd("autocmd FileType gitcommit setlocal spell spelllang=en_us,es_es")

vim.cmd("set complete+=kspell")

-- Use telescope on spell suggestion list
vim.api.nvim_set_keymap('n', 'z=',
  "<cmd>lua require('telescope.builtin').spell_suggest()<CR>", {noremap=true, silent=true})

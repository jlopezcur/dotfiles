local map = vim.api.nvim_set_keymap

options = {noremap=true, silent=true}

map('n', '<Leader>dd', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", options)
map('n', '<Leader>db', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", options)
map('n', '<Leader>dc', "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", options)
map('n', '<Leader>dj', "<cmd>lua require'dap'.step_into()<CR>", options)
map('n', '<Leader>dk', "<cmd>lua require'dap'.step_out()<CR>", options)
map('n', '<Leader>dj', "<cmd>lua require'dap'.step_over()<CR>", options)
map('n', '<Leader>dl', "<cmd>lua require'dap'.continue()<CR>", options)
map('n', '<Leader>drr', "<cmd>lua require'dap'.repl.open()<CR>", options)
map('n', '<Leader>drl', "<cmd>lua require'dap'.repl.run_last()<CR>", options)

-- require'telescope'.extensions.dap.commands{}
-- require'telescope'.extensions.dap.configurations{}
map('n', '<Leader>dp', "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", options)
-- require'telescope'.extensions.dap.variables{}

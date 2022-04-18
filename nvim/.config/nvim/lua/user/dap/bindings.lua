local dap = require "dap"

function _dap_attach()
  print("attaching...")
  dap.run(
    {
      type = "node2",
      request = "attach",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = {"<node_internals>/**/*.js"}
    }
  )
end

vim.keymap.set("n", "<Leader>dd", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>db", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<Leader>dc", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<Leader>dj", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<Leader>dk", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<Leader>dj", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<Leader>dl", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<Leader>drr", ":lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<Leader>drl", ":lua require'dap'.repl.run_last()<CR>")

vim.keymap.set("n", "<leader>da", ":lua _dap_attach()<CR>")
vim.keymap.set("n", "<leader>dA", ':lua require"debugHelper".attachToRemote()<CR>')

-- require'telescope'.extensions.dap.commands{}
-- require'telescope'.extensions.dap.configurations{}
vim.keymap.set("n", "<Leader>dp", ":lua require'telescope'.extensions.dap.list_breakpoints{}<CR>")
-- require'telescope'.extensions.dap.variables{}

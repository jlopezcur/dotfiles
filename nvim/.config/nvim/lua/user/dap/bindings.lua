local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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

map("n", "<Leader>dd", ":lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<Leader>db", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<Leader>dc", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<Leader>dj", ":lua require'dap'.step_into()<CR>")
map("n", "<Leader>dk", ":lua require'dap'.step_out()<CR>")
map("n", "<Leader>dj", ":lua require'dap'.step_over()<CR>")
map("n", "<Leader>dl", ":lua require'dap'.continue()<CR>")
map("n", "<Leader>drr", ":lua require'dap'.repl.open()<CR>")
map("n", "<Leader>drl", ":lua require'dap'.repl.run_last()<CR>")

map("n", "<leader>da", ":lua _dap_attach()<CR>")
map("n", "<leader>dA", ':lua require"debugHelper".attachToRemote()<CR>')

-- require'telescope'.extensions.dap.commands{}
-- require'telescope'.extensions.dap.configurations{}
map("n", "<Leader>dp", ":lua require'telescope'.extensions.dap.list_breakpoints{}<CR>")
-- require'telescope'.extensions.dap.variables{}

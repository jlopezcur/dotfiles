require("telescope").load_extension("dap")

require "user.dap.bindings"

-- require("dapui").setup()

require "user.dap.dbg.node"

vim.highlight.create("DapBreakpoint", {ctermbg = 0, guifg = "#993939", guibg = "#31353f"}, false)
vim.highlight.create("DapLogPoint", {ctermbg = 0, guifg = "#61afef", guibg = "#31353f"}, false)
vim.highlight.create("DapStopped", {ctermbg = 0, guifg = "#98c379", guibg = "#31353f"}, false)

-- vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})

vim.fn.sign_define("DapBreakpoint", {text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint"})
vim.fn.sign_define(
  "DapBreakpointCondition",
  {text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint"}
)
vim.fn.sign_define(
  "DapBreakpointRejected",
  {text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint"}
)
vim.fn.sign_define("DapLogPoint", {text = "", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint"})
vim.fn.sign_define("DapStopped", {text = "", texthl = "DapStopped", linehl = "", numhl = "DapStopped"})

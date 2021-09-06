require('telescope').load_extension('dap')

require "lt.dap.bindings"

-- require("dapui").setup()

require "lt.dap.dbg.node"

vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})


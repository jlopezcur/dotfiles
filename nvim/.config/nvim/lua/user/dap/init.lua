require('telescope').load_extension('dap')

require "user.dap.bindings"

-- require("dapui").setup()

require "user.dap.dbg.node"

vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})


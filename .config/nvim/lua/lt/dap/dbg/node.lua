local dap = require('dap')

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/.config/nvm/12.16.3/lib/node_modules/node-debug2/bin/node-debug.js'}
}

dap.configurations.javascript = {
  {
    name = 'Node file',
    type = 'node2',
    request = 'launch',
    -- program = '${workspaceFolder}/${file}',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Node file2',
    type = 'node2',
    request = 'launch',
    -- program = '${workspaceFolder}/${file}',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}


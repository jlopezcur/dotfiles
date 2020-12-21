local vim = vim
local nvim_lsp = require'lspconfig'

local on_attach_vim = function(client)
  print("'" .. client.name .. "' language server attached");
	require'completion'.on_attach(client)

  vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})

  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'i', '<c-K>', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})

  vim.api.nvim_buf_set_keymap(0, 'n', ',,p', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true})

  vim.api.nvim_buf_set_keymap(0, 'n', 'dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', 'dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true})

  vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
end

local servers = {
  "tsserver",
  "sumneko_lua",
  "vimls",
  "html",
  "yamlls",
  "cssls",
  "jsonls",
  "bashls",
  "texlab",
  "rls",
  "hls",
  "pyls",
}

for _, server in ipairs(servers) do nvim_lsp[server].setup{on_attach=on_attach_vim} end

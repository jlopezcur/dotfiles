local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local custom_attach = require("lt.lsp.custom_attach")
local efmConfig = require("lt.lsp.efm")
local home = vim.fn.expand("$HOME")
local build = home .. "/bin/build/lua-language-server"
local bin = build .. "/bin/Linux/lua-language-server"

local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.lsp.set_log_level("debug")
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {}

servers.bashls = {
  on_attach = function(client)
    custom_attach(client)
  end
}

servers.vimls = {
  on_attach = function(client)
    custom_attach(client)
  end
}

servers.jsonls = {
  on_attach = function(client)
    custom_attach(client)
    client.resolved_capabilities.document_formatting = false
  end
}

servers.pyright = {
  on_attach = function(client)
    custom_attach(client)
  end
}

servers.html = {
  on_attach = function(client)
    custom_attach(client)
    client.resolved_capabilities.document_formatting = false
  end
}

servers.cssls = {
  on_attach = function(client)
    custom_attach(client)
    client.resolved_capabilities.document_formatting = false
  end
}

servers.tsserver = {
  root_dir = util.root_pattern(
    "package.json",
    "tsconfig.json",
    "jsconfig.json",
    ".git",
    vim.fn.getcwd()
  ),
  on_attach = function(client)
    custom_attach(client)
    client.resolved_capabilities.document_formatting = false
  end
}

servers.efm = efmConfig

for server, config in pairs(servers) do
  lspconfig[server].setup(
    vim.tbl_deep_extend("force", {capabilities = capabilities}, config)
  )
end

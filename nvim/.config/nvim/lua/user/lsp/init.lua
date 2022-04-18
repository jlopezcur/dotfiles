local lspconfig = require("lspconfig")

--
-- keymaps
--

local on_attach = function(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]],
      false
    )
  end
end

vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
vim.keymap.set("n", "ga", require("telescope.builtin").lsp_code_actions)
vim.keymap.set("v", "ga", require("telescope.builtin").lsp_range_code_actions)
vim.keymap.set("n", "go", require("telescope.builtin").lsp_document_symbols)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<space>d", vim.diagnostic.setloclist)

--
-- servers
--

local servers = {
  "tsserver",
  "bashls"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach
  }
end

--
-- clang
--

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/clangd/clangd/bin/clangd"}
}

--
-- html
--

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/html/node_modules/.bin/vscode-html-language-server", "--stdio"}
}

--
-- python
--

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/python/node_modules/.bin/pyright-langserver", "--stdio"}
}

--
-- latex
--

lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/latex/texlab"},
  standalone = false
}

--
-- css
--

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/cssls/node_modules/.bin/vscode-css-language-server", "--stdio"},
  single_file_support = true
}

--
-- eslint
--

lspconfig.eslint.setup {}

--
-- lua
--

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"},
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim", "use"}
      },
      telemetry = {
        enable = false
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      }
    }
  }
}

--
-- json
--

lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  settings = {
    json = {
      schemas = require("schemastore").json.schemas()
    }
  }
}

--
-- yaml
--

lspconfig.yamlls.setup {
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  settings = {
    yaml = {
      schemas = {
        ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
        ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
        ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
        ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
        ["http://json.schemastore.org/stylelintrc"] = ".stylelintrc.{yml,yaml}",
        ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}"
      }
    }
  }
}

--
-- diagnostic
--

vim.diagnostic.config({update_in_insert = true})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      source = "always" -- Or "if_many"
    }
  }
)

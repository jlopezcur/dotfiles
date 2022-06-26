--
-- Configuration
--

local lspconfig = require("lspconfig")

-- decorations
local border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = border})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})

-- config
vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

--
-- Mappings
--

vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
vim.keymap.set("n", "ga", vim.lsp.buf.code_action)
vim.keymap.set("v", "ga", vim.lsp.buf.range_code_action)
vim.keymap.set("n", "go", require("telescope.builtin").lsp_document_symbols)

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<space>d", vim.diagnostic.setloclist)

--
-- servers
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

-- clang
lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/clangd/clangd/bin/clangd"}
}

-- html
lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/html/node_modules/.bin/vscode-html-language-server", "--stdio"}
}

-- python
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/python/node_modules/.bin/pyright-langserver", "--stdio"}
}

-- latex
lspconfig.texlab.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/latex/texlab"},
  standalone = false
}

-- css
lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/cssls/node_modules/.bin/vscode-css-language-server", "--stdio"},
  single_file_support = true
}

-- eslint
lspconfig.eslint.setup {}

-- lua
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

-- json
lspconfig.jsonls.setup {
  on_attach = on_attach,
  capabilities = require "cmp_nvim_lsp".update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = {enable = true}
    }
  }
}

-- yaml
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

-- diagnostic
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

vim.diagnostic.open_float =
  (function(orig)
  return function(opts)
    local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
    -- A more robust solution would check the "scope" value in `opts` to
    -- determine where to get diagnostics from, but if you're only using
    -- this for your own purposes you can make it as simple as you like
    local diagnostics = vim.diagnostic.get(opts.bufnr or 0, {lnum = lnum})
    local max_severity = vim.diagnostic.severity.HINT
    for _, d in ipairs(diagnostics) do
      -- Equality is "less than" based on how the severities are encoded
      if d.severity < max_severity then
        max_severity = d.severity
      end
    end
    local border_color =
      ({
      [vim.diagnostic.severity.HINT] = "NonText",
      [vim.diagnostic.severity.INFO] = "Question",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
      [vim.diagnostic.severity.ERROR] = "ErrorMsg"
    })[max_severity]
    opts.border = {
      {"╭", border_color},
      {"─", border_color},
      {"╮", border_color},
      {"│", border_color},
      {"╯", border_color},
      {"─", border_color},
      {"╰", border_color},
      {"│", border_color}
    }
    orig(opts)
  end
end)(vim.diagnostic.open_float)

local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()

--
-- keymaps
--

local on_attach = function(client, bufnr)
  local function set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = {noremap = true, silent = true}
  set_keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opts)
  set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  set_keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  set_keymap("n", "go", "<cmd>Telescope lsp_document_symbols<CR>", opts)
  set_keymap("n", "<leader>fa", "<cmd>Telescope lsp_code_actions<CR>", opts)
  set_keymap("v", "<leader>fa", "<cmd>Telescope lsp_range_code_actions<CR>", opts)
  set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  set_keymap("n", "<space>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

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

--
-- servers
--

local servers = {
  "pyright",
  "tsserver",
  "html",
  "bashls",
  "clangd"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

--
-- latex
--

lspconfig.texlab.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/latex/texlab"},
  standalone = false
}

--
-- css
--

lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/cssls/node_modules/.bin/vscode-css-language-server", "--stdio"},
  single_file_support = true,
}

--
-- eslint
--

lspconfig.eslint.setup {}

--
-- lua
--

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {vim.fn.stdpath "data" .. "/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server"},
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"}
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
  capabilities = capabilities,
  on_attach = on_attach,
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

vim.diagnostic.config(
  {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false
  }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      source = "always" -- Or "if_many"
    }
  }
)

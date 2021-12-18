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
  "cssls",
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
lspconfig.eslint.setup {}

lspconfig.arduino_language_server.setup(
  {
    cmd = {
      -- Required
      "arduino-language-server",
      "-cli-config",
      "$HOME/.arduino15/arduino-cli.yaml",
    }
  }
)

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
-- local sumneko_binary = "/usr/bin/lua-language-server"
--
-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
--
-- lspconfig.sumneko_lua.setup {
--   capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   cmd = {sumneko_binary},
--   on_attach = function(client, bufnr)
--     client.resolved_capabilities.document_formatting = false
--     on_attach(client, bufnr)
--   end,
--   settings = {
--     runtime = {
--       version = "LuaJIT",
--       path = runtime_path
--     },
--     diagnostic = {
--       globals = {"vim"}
--     },
--     workspace = {
--       library = vim.api.nvim_get_runtime_file("", true)
--     },
--     telemetry = {
--       enable = false
--     }
--   }
-- }
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

-- require "lt.lsp.json"

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

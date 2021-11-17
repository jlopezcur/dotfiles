local nvim_lsp = require("lspconfig")

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
  set_keymap("n", "gD", "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
  set_keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opts)
  set_keymap("n", "gh", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  set_keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  set_keymap("n", "go", "<cmd>Telescope lsp_document_symbols<CR>", opts)
  set_keymap("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
  set_keymap("n", "<leader>fa", "<cmd>Telescope lsp_code_actions<CR>", opts)
  set_keymap("v", "<leader>fa", "<cmd>Telescope lsp_range_code_actions<CR>", opts)
  set_keymap("n", "<leader>fo", '<cmd>lua require("lt.lsp.functions").organize_imports()<CR>', opts)
  set_keymap("n", "<leader>fe", "<cmd>lua require('lt.lsp.functions').show_diagnostics()<CR>", opts)
  set_keymap("n", "<leader>fE", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
  set_keymap("n", "[d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
  set_keymap("n", "]d", "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts)
  set_keymap("n", "<leader>rn", "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

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
  "rust_analyzer",
  "cssls",
  "html",
  "bashls",
  "clangd",
  "yamlls"
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      on_attach(client, bufnr)
    end
  }
end
nvim_lsp.eslint.setup {}

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- local sumneko_root_path = vim.fn.stdpath("cache") .. "/lspconfig/sumneko_lua/lua-language-server"
-- local sumneko_binary = "/usr/bin/lua-language-server"
--
-- local runtime_path = vim.split(package.path, ";")
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
--
-- nvim_lsp.sumneko_lua.setup {
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

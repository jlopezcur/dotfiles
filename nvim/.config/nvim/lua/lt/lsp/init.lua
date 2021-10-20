local nvim_lsp = require('lspconfig')

--
-- keymaps
--

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", opts)
  buf_set_keymap('n', 'gd', "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", opts)
  buf_set_keymap('n', 'gh', "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  buf_set_keymap('n', 'go', "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", opts)
  buf_set_keymap('n', 'gs', "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", opts)
  buf_set_keymap('n', '<leader>fa', "<cmd>lua require('telescope.builtin').lsp_code_actions({ timeout = 1000 })<CR>", opts)
  buf_set_keymap('v', '<leader>fa', "<cmd>lua require('telescope.builtin').lsp_range_code_actions({ timeout = 1000 })<CR>", opts)
  buf_set_keymap('n', '<leader>fo', '<cmd>lua require("lt.lsp.functions").organize_imports()<CR>', opts)
  buf_set_keymap('n', '<leader>fe', "<cmd>lua require('lt.lsp.functions').show_diagnostics()<CR>", opts)
  buf_set_keymap('n', '<leader>fE', "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", opts)
  buf_set_keymap('n', '[d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>", opts)
  buf_set_keymap('n', ']d', "<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>", opts);
  buf_set_keymap('n', '<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
  -- if client.resolved_capabilities.document_formatting then
  --   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  -- elseif client.resolved_capabilities.document_range_formatting then
  --   buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  -- end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
    augroup lsp_document_highlight
    autocmd! * <buffer>
    autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
  end
end

--
-- servers
--

nvim_lsp.pyright.setup{}
nvim_lsp.tsserver.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function (client, bufnr)
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end
}
nvim_lsp.eslint.setup{}
nvim_lsp.rust_analyzer.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach
}
nvim_lsp.cssls.setup{}
nvim_lsp.html.setup{}
nvim_lsp.bashls.setup{}
nvim_lsp.clangd.setup{}
-- nvim_lsp.sumneko_lua.setup{}
nvim_lsp.yamlls.setup{}

local vim = vim
local lsp = require'lspconfig'

local map = function(type, key, value)
	vim.fn.nvim_buf_set_keymap(0,type,key,value,{noremap = true, silent = true});
end

local on_attach_common = function(client)
  print("LSP started.");
	require'completion'.on_attach(client)
	require'diagnostic'.on_attach(client)

	-- GOTO mappings
	map('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	map('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	-- map('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
	map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	map('n','<leader>gw','<cmd>lua vim.lsp.buf.document_symbol()<CR>')
	map('n','<leader>gW','<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')

	-- ACTION mappings
	map('n','<leader>ah',  '<cmd>lua vim.lsp.buf.hover()<CR>')
	map('n','<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
	map('n','<leader>ee', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
	map('n','<leader>ar',  '<cmd>lua vim.lsp.buf.rename()<CR>')

	-- Few language severs support these three
	map('n','<leader>=',  '<cmd>lua vim.lsp.buf.formatting()<CR>')
	map('n','<leader>ai',  '<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
	map('n','<leader>ao',  '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')

	-- if diagnostic plugin is installed
	map('n','<leader>ep','<cmd>PrevDiagnosticCycle<CR>')
	map('n','<leader>en','<cmd>NextDiagnosticCycle<CR>')
end

local custom_attach = function(client)
	on_attach_common(client)
	map('n','<leader>i', '<cmd>lua vim.lsp.buf.code_action({source = { organizeImports = true }})<CR>')
end

lsp.tsserver.setup{on_attach = custom_attach}

lsp.sumneko_lua.setup{on_attach=custom_attach}

lsp.vimls.setup{on_attach=custom_attach}

lsp.html.setup{on_attach=custom_attach}

lsp.yamlls.setup{on_attach=custom_attach}

lsp.cssls.setup{on_attach=custom_attach}

lsp.dockerls.setup{on_attach=custom_attach}

lsp.jsonls.setup{on_attach=custom_attach}

lsp.jdtls.setup{on_attach=custom_attach}

lsp.bashls.setup{on_attach=custom_attach}

lsp.texlab.setup{on_attach=custom_attach}

lsp.rls.setup{on_attach=custom_attach}

lsp.hls.setup{on_attach=custom_attach}

lsp.pyls.setup{on_attach=custom_attach}

local strategy = { 'exact', 'substring', 'fuzzy' }
vim.g.completion_matching_strategy_list = strategy
vim.g.diagnostic_enable_virtual_text = 1
vim.g.space_before_virtual_text = 5

vim.lsp.callbacks['textDocument/codeAction'] =
require'lsputil.codeAction'.code_action_handler
-- vim.lsp.callbacks['textDocument/codeAction'] =
-- function(_,_,action)
-- 	print(vim.inspect(action))
-- end

vim.lsp.callbacks['textDocument/references'] =
require'lsputil.locations'.references_handler

vim.lsp.callbacks['textDocument/definition'] =
require'lsputil.locations'.definition_handler

vim.lsp.callbacks['textDocument/declaration'] =
require'lsputil.locations'.declaration_handler

vim.lsp.callbacks['textDocument/typeDefinition'] =
require'lsputil.locations'.typeDefinition_handler

vim.lsp.callbacks['textDocument/implementation'] =
require'lsputil.locations'.implementation_handler

vim.lsp.callbacks['textDocument/documentSymbol'] =
require'lsputil.symbols'.document_handler

vim.lsp.callbacks['workspace/symbol'] =
require'lsputil.symbols'.workspace_handler

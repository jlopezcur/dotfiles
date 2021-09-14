local M = {}

function M.set(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }
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

  if client.renameProvider then
    -- buf_set_keymap('n','<leader>rn','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n','<leader>rn', "<cmd>lua require('lspsaga.rename').rename()<CR>", opts)
  end

  buf_set_keymap('n','<leader>fcd', ':lua print(vim.inspect(vim.lsp.get_active_clients()))<CR>', opts)
  buf_set_keymap('n','<leader>fcl', ":lua print(vim.lsp.get_log_path())<CR>", opts)
  -- buf_set_keymap('n','<leader>fcl', ":lua vim.cmd('e'..vim.lsp.get_log_path())<CR>", opts)
  buf_set_keymap('n','<leader>fci', ':LspInfo()<CR>', opts)

  -- imap('<c-p>', '<Plug>(completion_trigger)')
  -- imap('<Tab>', '<Plug>(completion_smart_tab)')
  -- imap('<S-Tab>', '<Plug>(completion_smart_s_tab)')
  -- imap('<c-j>', '<Plug>(completion_next_source)') --use <c-j> to switch to previous completion
  -- imap('<c-k>', '<Plug>(completion_prev_source)') --use <c-k> to switch to next completion

  -- using tab for navigating in completion
  -- vim.api.nvim_exec(
  -- [[
  -- inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  -- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  -- ]],
  -- true)


    -- map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>')
    -- map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
    -- map('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
    -- map('n','<leader>ah','<cmd>lua vim.lsp.buf.hover()<CR>')
    -- map('n','<leader>af','<cmd>lua vim.lsp.buf.code_action()<CR>')
    -- map('n','<leader>ee','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>')
    -- map('n','<leader>ai','<cmd>lua vim.lsp.buf.incoming_calls()<CR>')
    -- map('n','<leader>ao','<cmd>lua vim.lsp.buf.outgoing_calls()<CR>')
end

return M

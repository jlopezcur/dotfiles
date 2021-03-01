local map = vim.api.nvim_set_keymap

local mapper = function(mode, key, result)
  map(
    mode,
    key,
    "<cmd>lua " .. result .. "<cr>",
    {noremap = true, silent = true}
  )
end

local function custom_attach(client)
  print("'" .. client.name .. "' language server attached");

  if client.resolved_capabilities.goto_definition then
    mapper("n", "gd", "vim.lsp.buf.definition()")
  end

  if client.resolved_capabilities.implementation then
    mapper("n", "gD", "vim.lsp.buf.implementation()")
  end

  if client.resolved_capabilities.document_formatting then
    mapper("n", "<space>f", "vim.lsp.buf.formatting()")
  elseif client.resolved_capabilities.document_range_formatting then
    mapper("n", "<space>f", "vim.lsp.buf.formatting()")
  end

  local ft = vim.api.nvim_buf_get_option(0, "filetype")
  if ft ~= "lua" then
    mapper("n", "K", "vim.lsp.buf.hover()")
  end

  -- diagnostic
  
  mapper("n", "[d", "vim.lsp.diagnostic.goto_prev()")
  mapper("n", "]d", "vim.lsp.diagnostic.goto_next()")

end

return custom_attach

-- keymaps
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
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

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

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = 'LuaJIT',
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {'vim'},
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
      },
    },
  }
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- lsp-install
local function setup_servers()
  require'lspinstall'.setup()

  -- get all installed servers
  local servers = require'lspinstall'.installed_servers()
  -- ... and add manually installed servers
  table.insert(servers, "clangd")

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end
    if server == "clangd" then
      config.filetypes = {"c", "cpp"}; -- we don't want objective-c and objective-cpp!
    end
    if server == "typescript" then
      config.on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
      end
    end

    if server == "diagnosticls" then
      local ft = {
        "typescript",
        "reacttypescript",
        "javascript",
        "javascript.jsx",
        "reactjavacript"
      }
      config.filetypes = ft
      config.init_options = {
        filetypes = ft,
        linters = {
          eslint = {
            sourceName = "eslint",
            command = "eslint_d",
            rootPatterns = {".eslintrc.js", "package.json"},
            debounce = 100,
            args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
            parseJson = {
              errorsRoot = "[0].messages",
              line = "line",
              column = "column",
              endLine = "endLine",
              endColumn = "endColumn",
              message = "${message} [${ruleId}]",
              security = "severity"
            },
            securities = {[2] = "error", [1] = "warning"}
          }
        },
        formatters = {
          prettier = {
            command = "prettier",
            args = { "--stdin-filepath", "%filepath" }
          },
          formatFiletypes = {
            typescript = "prettier",
            typescriptreact = "prettier",
            javascript = "prettier",
            javascriptreact = "prettier"
          }
        }
      }
    end

    require'lspconfig'[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

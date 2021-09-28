local prettierForJS = {
  -- prettier
  function()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
      stdin = true
    }
  end
}
local prettierForOthers = {
  -- prettier
  function()
    return {
      exe = "prettier",
      args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
      stdin = true
    }
  end
}
require('formatter').setup({
  filetype = {
    javascript = prettierForJS,
    javascriptreact = prettierForJS,
    typescript = prettierForJS,
    typescriptreact = prettierForJS,
    yaml = prettierForOthers,
    json = prettierForOthers,
    html = prettierForOthers,
    scss = prettierForOthers,
    css = prettierForOthers,
    markdown = prettierForOthers,
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    python = {
      -- Rustfmt
      function()
        return {
          exe = "pyformat",
          stdin = true
        }
      end
    },
    sh = {
      -- Shell Script Formatter
      function()
        return {
          exe = "shfmt",
          args = { "-i", 2 },
          stdin = true,
        }
      end
    },
    lua = {
      -- luafmt
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    },
  }
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n','<space>f', '<cmd>Format<CR>', opts)
map('v','<space>f', '<cmd>Format<CR>', opts)

-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.rs,*.lua FormatWrite
-- augroup END
-- ]], true)

require("rust-tools").setup(
  {
    server = {
      cmd = {vim.fn.stdpath "data" .. "/lsp_servers/rust/rust-analyzer"},
      standalone = false
    }
  }
)

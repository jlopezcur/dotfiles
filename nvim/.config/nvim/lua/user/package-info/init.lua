require("package-info").setup(
  {
    colors = {
      up_to_date = "#3C4048", -- Text color for up to date package virtual text
      outdated = "#d19a66" -- Text color for outdated package virtual text
    }
  }
)

-- Show package versions
vim.keymap.set("n", "<leader>ns", ":lua require('package-info').show()<CR>")

-- Hide package versions
vim.keymap.set("n", "<leader>nc", ":lua require('package-info').hide()<CR>")

-- Update package on line
vim.keymap.set("n", "<leader>nu", ":lua require('package-info').update()<CR>")

-- Delete package on line
vim.keymap.set("n", "<leader>nd", ":lua require('package-info').delete()<CR>")

-- Install a new package
vim.keymap.set("n", "<leader>ni", ":lua require('package-info').install()<CR>")

-- Reinstall dependencies
vim.keymap.set("n", "<leader>nr", ":lua require('package-info').reinstall()<CR>")

-- Install a different package version
vim.keymap.set("n", "<leader>np", ":lua require('package-info').change_version()<CR>")

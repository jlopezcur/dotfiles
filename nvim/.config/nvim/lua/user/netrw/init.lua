vim.g.netrw_bufsettings = "noma nomod nowrap ro nobl rnu"
vim.g.netrw_liststyle = 0
-- vim.g.netrw_fastbrowse = 0
vim.g.netrw_sort_by = "name exten"
-- vim.g.netrw_list_hide ="*facets"
-- vim.cmd("let g:netrw_list_hide= '^\.\.\=/\=$'")
-- vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = "cp -r"

-- remove any file or directory directly
-- TODO multiple files or directories
local function _remove_files_or_directories()
  local file = vim.fn.expand([[<cfile>]])
  local path = vim.fn.expand([[%:p]]) .. file
  if vim.fn.input(string.format("Delete '%s'? (N/y) ", file)) == "y" then
    vim.cmd(":!rm -rf " .. path)
    vim.cmd([[:Explore]])
  end
end

-- modify the premissions of a file or directory
-- TODO multiple files or directories
local function _chmod_file()
  local file = vim.fn.expand([[<cfile>]])
  local path = vim.fn.expand([[%:p]]) .. file
  local result = vim.fn.input(string.format("Set permissions for '%s': (leave it blank for exit) ", file))
  if result ~= "" then
    print(" ")
    vim.cmd(string.format(":!chmod %s %s", result, path))
    vim.cmd([[:Explore]])
  end
end

-- rename a file or directory
-- TODO multiple files or directories
local function _rename_file()
  local file = vim.fn.expand([[<cfile>]])
  local path = vim.fn.expand([[%:p]]) .. file
  local result = vim.fn.input(string.format("Rename '%s' as: (leave it blank for exit) ", file))
  local new_path = vim.fn.expand([[%:p]]) .. result
  if result ~= "" then
    print(" ")
    vim.cmd(string.format(":!mv %s %s", path, new_path))
    vim.cmd([[:e]])
    vim.notify("Done!", 0, {})
  end
end

-- This is for testing
local function _testing()
  print(vim.fn.expand([[<cfile>:p]]))
end

vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter"},
  {
    pattern = "*",
    callback = function()
      if vim.bo.filetype == "netrw" then
        vim.keymap.set("n", "M", _chmod_file)
        vim.keymap.set("n", "R", _rename_file)
        vim.keymap.set("n", "T", _testing)
        vim.keymap.set("n", "dd", _remove_files_or_directories)
      end
    end,
    desc = "set the netrw keymaps"
  }
)

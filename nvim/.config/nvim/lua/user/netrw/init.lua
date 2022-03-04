require "mapx".setup {global = true}

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
function _remove_files_or_directories()
  local file = vim.fn.expand([[<cfile>]])
  local path = vim.fn.expand([[%:p]]) .. file
  if vim.fn.input(string.format("Delete '%s'? (N/y) ", file)) == "y" then
    vim.cmd(':!rm -rf ' .. path)
    vim.cmd([[:Explore]])
  end
end
nnoremap("dd", ":lua _remove_files_or_directories()<cr>", "silent", {ft = "netrw"})

-- modify the premissions of a file or directory
-- TODO multiple files or directories
function _chmod_file()
  local file = vim.fn.expand([[<cfile>]])
  local path = vim.fn.expand([[%:p]]) .. file
  local result = vim.fn.input(string.format("Set permissions for '%s': (leave it blank for exit) ", file))
  if result ~= "" then
    print(' ')
    vim.cmd(string.format(':!chmod %s %s', result, path))
    vim.cmd([[:Explore]])
  end
end
nnoremap("M", ":lua _chmod_file()<cr>", "silent", {ft = "netrw"})

-- rename a file or directory
-- TODO multiple files or directories
function _rename_file()
  local file = vim.fn.expand([[<cfile>]])
  local path = vim.fn.expand([[%:p]]) .. file
  local result = vim.fn.input(string.format("Rename '%s' as: (leave it blank for exit) ", file))
  local new_path = vim.fn.expand([[%:p]]) .. result
  if result ~= "" then
    print(' ')
    vim.cmd(string.format(':!mv %s %s', path, new_path))
    vim.cmd([[:e]])
    vim.notify("Done!", 0, {})
  end
end
nnoremap("R", ":lua _rename_file()<cr>", "silent", {ft = "netrw"})

-- This is for testing
function _testing()
  print(vim.fn.expand([[<cfile>:p]]))
end
nnoremap("T", ":lua _testing()<cr>", "silent", {ft = "netrw"})

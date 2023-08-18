if vim.fn.has("mac") == 1 then
  vim.g.previm_open_cmd = "open -a floorp"
  vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
elseif vim.fn.has("linux") == 1 then
  vim.g.previm_open_cmd = "xdg-open"
  vim.g.python3_host_prog = "/usr/bin/python3"
end

vim.wo.number = true

vim.scriptencoding = "utf-8"

vim.cmd [[
  filetype on
  filetype plugin indent on
]]

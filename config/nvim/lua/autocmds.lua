vim.cmd [[
  autocmd Filetype *.jsx inoremap <buffer> </ </<C-x><C-o><ESC>F<i
  autocmd Filetype *.tsx inoremap <buffer> </ </<C-x><C-o><ESC>F<i
  autocmd BufWritePre * :lua vim.lsp.buf.format()
]]

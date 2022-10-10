"autocmd BufWritePre * :lua vim.lsp.buf.formatting()
autocmd Filetype *.tsx inoremap <buffer> </ </<C-x><C-o><ESC>F<i

vim.cmd [[
   autocmd Filetype *.jsx inoremap <buffer> </ </<C-x><C-o><ESC>F<i
   autocmd Filetype *.tsx inoremap <buffer> </ </<C-x><C-o><ESC>F<i
   autocmd BufWritePre * :lua vim.lsp.buf.format()
   augroup my-glyph-palette
      autocmd! *
      autocmd FileType fern call glyph_palette#apply()
      autocmd FileType nerdtree,startify call glyph_palette#apply()
   augroup END
]]

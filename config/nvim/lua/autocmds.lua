vim.cmd [[
   autocmd Filetype *.jsx inoremap <buffer> </ </<C-x><C-o><ESC>F<i
   autocmd Filetype *.tsx inoremap <buffer> </ </<C-x><C-o><ESC>F<i
   autocmd BufWritePre * :lua vim.lsp.buf.format()
   augroup my-glyph-palette
      autocmd! *
      autocmd FileType fern call glyph_palette#apply()
      autocmd FileType nerdtree,startify call glyph_palette#apply()
   augroup END

 autocmd TabEnter,CursorHold,FocusGained <buffer>
	\ call ddu#ui#filer#do_action('checkItems')

autocmd FileType ddu-filer call Ddu_filer_my_settings()
]]

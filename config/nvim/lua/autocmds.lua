local api = vim.api;

vim.cmd [[
"   autocmd Filetype *.jsx inoremap <buffer> </ </<C-x><C-o><ESC>F<i
"   autocmd Filetype *.tsx inoremap <buffer> </ </<C-x><C-o><ESC>F<i
   " autocmd BufWritePre * :lua vim.lsp.buf.format()
 ]]

api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

api.nvim_create_autocmd("FileType", {
  pattern = "fern",
  callback = function()
    vim.cmd [[
      call Init_fern()
      ]]
  end
})

api.nvim_create_augroup("my-glyph-palette", { clear = true })
api.nvim_create_autocmd("FileType", {
  pattern = "fern",
  callback = function()
    vim.cmd [[
      call glyph_palette#apply()
      ]]
  end
})

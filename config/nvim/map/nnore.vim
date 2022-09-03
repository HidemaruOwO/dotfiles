nnoremap <silent><Space>v :call sml#mode_on()<CR>
nnoremap <silent><C-t> :call DeolFloat()<CR>
nnoremap <silent><C-s> :Ag<CR>
nnoremap <silent><C-q> :Lspsaga hover_doc<CR>
nnoremap <silent><C-j> :Lspsaga diagnostic_jump_next<CR> 
nnoremap <silent>gd :Lspsaga lsp_finder<CR> 
nnoremap <silent>gp :Lspsaga preview_definition<CR> 
nnoremap <silent>gr :Lspsaga rename<CR> 

lua << EOF
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

EOF

nnoremap <silent><Space>v :call sml#mode_on()<CR>
nnoremap <silent><C-t> :call DeolFloat()<CR>
nnoremap <silent><C-s> :Ag<CR>
nnoremap <silent><C-q> :Lspsaga hover_doc<CR>
nnoremap <silent><C-j> :Lspsaga diagnostic_jump_next<CR> 
nnoremap <silent>gd :Lspsaga lsp_finder<CR> 
nnoremap <silent>gp :Lspsaga preview_definition<CR> 
nnoremap <silent>gr :Lspsaga rename<CR> 
nnoremap <silent><C-f> :lua vim.lsp.buf.formatting()<CR>
nnoremap <silent>fp :Prettier<CR>
nnoremap <silent><C-h> <C-w>h<CR>
nnoremap <silent><C-j> <C-j>j<CR>
nnoremap <silent><C-k> <C-w>k<CR>
nnoremap <silent><C-l> <C-w>l<CR>

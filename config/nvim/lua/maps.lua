local map = vim.api.nvim_set_keymap

local opt = { silent = true, noremap = true }
local opt_expr = { silent = true, noremap = true, expr = true }

map("n", "<Space>v", ":call sml#mode_on()<CR>", opt)
map("i", "<C-b>", "<br/>", opt)
map("n", "<C-b>", "a<br/><ESC>", opt)
map("n", "<C-t>", ":call DeolFloat()<CR>", opt)
map("n", "<C-s>", ":Ag<CR>", opt)
map("n", "<C-q>", ":Lspsaga hover_doc<CR>", opt)
map("n", "<C-j>", ":Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "<C-f>", ":lua vim.lsp.buf.format()<CR>", opt)
map("n", "<C-h>", "<C-w>h<CR>", opt)
map("n", "<C-j>", "<C-j>j<CR>", opt)
map("n", "<C-k>", "<C-w>k<CR>", opt)
map("n", "<C-l>", "<C-w>l<CR>", opt)
map("n", "<C-c>", ":Commentary<CR>", opt)
map("n", "<C-S-h>", ":BufferPrevious<CR>", opt)
map("n", "<C-S-l>", ":BufferNext<CR>", opt)
map("n", "<C-S-q>", ":BufferClose<CR>", opt)
map("n", "gd", ":Lspsaga lsp_finder<CR>", opt)
map("n", "gp", ":Lspsaga preview_definition<CR>", opt)
map("n", "gr", ":Lspsaga rename<CR>", opt)
map("n", "ga", ":Lspsaga code_action<CR>", opt)
map("n", "ge", ":Lspsaga show_line_diagnostics<CR>", opt)
map("n", "[e", ":Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "]e", ":Lspsaga diagnostic_jump_prev<CR>", opt)
-- Fern mapping
map("n", "<C-m>", ":FernToggle<CR>", opt)

vim.cmd [[
function! Init_fern() abort
	nmap <buffer><expr> <Plug>(fern-my-open-or-expand)
	      \ fern#smart#leaf(
	      \   "<Plug>(fern-action-open)",
	      \   "<Plug>(fern-action-expand)",
	      \ )

   nmap <buffer><nowait> <CR> <Plug>(fern-my-open-or-expand)
   nmap <buffer><nowait> S <Plug>(fern-action-open:split)
   nmap <buffer><nowait> s <Plug>(fern-action-open:vsplit)
   nmap <buffer><nowait> h <Plug>(fern-action-collapse)
   nmap <buffer><nowait> d <Plug>(fern-action-remove)
   nmap <buffer><nowait> c <Plug>(fern-action-copy)
   nmap <buffer><nowait> m <Plug>(fern-action-move)
   nmap <buffer><nowait> n <Plug>(fern-action-new-file)
 endfunction
]]
-- ddu-ui-filer
map("n", "<C-n>", ":DduFiler<CR>", opt)
-- Git Gutter mapping
map("n", "g[", ":GitGutterPrevHunk<CR>", opt)
map("n", "g]", ":GitGutterNextHunk<CR>", opt)
map("n", "gh", ":GitGutterLineHighlightsToggle<CR>", opt)
-- LazyGit
map("n", "gg", ":LazyGit<CR>", opt)

vim.cmd [[
function! Ddu_filer_my_settings() abort
  nnoremap <buffer><silent><expr> <CR>
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>"

  nnoremap <buffer><silent><expr> s
    \ ddu#ui#get_item()->get('isTree', v:false) ?
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>" :
    \ "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>"

  nnoremap <buffer><silent> <Esc>
    \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>

  nnoremap <buffer><silent> q
    \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>

  nnoremap <buffer><silent> ..
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>

  nnoremap <buffer><silent> c
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'copy'})<CR>

  nnoremap <buffer><silent> p
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'paste'})<CR>

  nnoremap <buffer><silent> d
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'delete'})<CR>

  nnoremap <buffer><silent> r
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'rename'})<CR>

  nnoremap <buffer><silent> m
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'move'})<CR>

  nnoremap <buffer><silent> nf
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>

  nnoremap <buffer><silent> nd
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newDirectory'})<CR>

  nnoremap <buffer><silent> yy
    \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'yank'})<CR>
endfunction
]]

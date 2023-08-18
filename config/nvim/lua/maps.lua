local map = vim.api.nvim_set_keymap

local opt = { silent = true, noremap = true }
local opt_expr = { silent = true, noremap = true, expr = true  }

map("n", "<Space>v", ":call sml#mode_on()<CR>", opt)
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
map("n", "gd", ":Lspsaga lsp_finder<CR>", opt)
map("n", "gp", ":Lspsaga preview_definition<CR>", opt)
map("n", "gr", ":Lspsaga rename<CR>", opt)
map("n", "fp", ":Prettier<CR>", opt)
-- Fern mapping
--map("n", "<C-n>", ":FernToggle<CR>", opt)
-- ddu-ui-filer
map("n", "<C-n>", ":DduFiler<CR>", opt)
-- Git Gutter mapping
map("n", "g[", ":GitGutterPrevHunk<CR>", opt)
map("n", "g]", ":GitGutterNextHunk<CR>", opt)
map("n", "gh", ":GitGutterLineHighlightsToggle<CR>", opt)
-- LazyGit
map("n", "lg", ":LazyGit<CR>", opt)

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
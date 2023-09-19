local map = vim.api.nvim_set_keymap

local opt = { silent = true, noremap = true }
local opt_expr = { silent = true, noremap = true, expr = true }

map("i", "<C-i>", 'copilot#Accept("<CR>")', opt_expr)
map("n", "<Space>v", "<Cmd>call sml#mode_on()<CR>", opt)
map("i", "<C-b>", "<br/>", opt)
map("n", "<C-b>", "a<br/><ESC>", opt)
map("n", "<C-t>", "<Cmd>lua require('FTerm').toggle()()<CR>", opt)
map("n", "<C-s>", "<Cmd>Telescope grep_string<CR>", opt)
map("n", "<C-q>", "<Cmd>Lspsaga hover_doc<CR>", opt)
map("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "<C-f>", "<Cmd>lua vim.lsp.buf.format()<CR>", opt)
map("n", "<C-c>", "<Cmd>Commentary<CR>", opt)
-- map("v", "<C-c>", "<Cmd>Commentary<CR>", opt)
map("n", "<C-S-r>", "<Cmd>source $MYVIMRC<CR>", opt)
-- barbar
-- map("n", "<C-S-h>", "<Cmd>BufferPrevious<CR>", opt)
-- map("n", "<S-Left>", "<Cmd>BufferPrevious<CR>", opt)
-- map("n", "<C-S-l>", "<Cmd>BufferNext<CR>", opt)
-- map("n", "<S-Right>", "<Cmd>BufferNext<CR>", opt)
-- map("n", "<C-S-q>", "<Cmd>BufferClose<CR>", opt)
map("n", "<C-S-l>", "<Cmd>Noice telescope<CR>", opt)
map("n", "<S-Right>", "<Cmd>Noice telescope<CR>", opt)
-- lspsaga
map("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opt)
map("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opt)
map("n", "gr", "<Cmd>Lspsaga rename<CR>", opt)
map("n", "ga", "<Cmd>Lspsaga code_action<CR>", opt)
map("n", "ge", "<Cmd>Lspsaga show_line_diagnostics<CR>", opt)
map("n", "[e", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opt)
map("n", "]e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
-- Fern mapping
map("n", "<C-m>", "<Cmd>FernToggle<CR>", opt)
-- Telescope
map("n", "<C-n>", "<Cmd>Telescope file_browser<CR>", opt)
map("n", "<C-S-n>", "<Cmd>Telescope frecency<CR>", opt)
map("n", "<C-.>", "<Cmd>Telescope symbols<CR>", opt)
-- Git Gutter mapping
map("n", "g[", "<Cmd>GitGutterPrevHunk<CR>", opt)
map("n", "g]", "<Cmd>GitGutterNextHunk<CR>", opt)
map("n", "gh", "<Cmd>GitGutterLineHighlightsToggle<CR>", opt)
-- LazyGit
map("n", "gg", "<Cmd>LazyGit<CR>", opt)

vim.cmd([[
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
]])

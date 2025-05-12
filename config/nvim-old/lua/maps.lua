local nmap = vim.api.nvim_set_keymap

local opt = { silent = true, noremap = true }
local opt_expr = { silent = true, noremap = true, expr = true }

local Terminal = require("toggleterm.terminal").Terminal
local term = Terminal:new({
	cmd = "fish",
	direction = "float",
	hidden = true,
})

function _term_toggle()
	term:toggle()
end

-- nmap("i", "<C-i>", 'copilot#Accept("<CR>")', opt_expr)
nmap("n", "<Space>v", "<Cmd>call sml#mode_on()<CR>", opt)
nmap("i", "<C-b>", "<br/>", opt)
nmap("n", "<C-b>", "a<br/><ESC>", opt)
nmap("n", "<C-t>", "<Cmd>lua _term_toggle()<CR>", opt)
nmap("n", "<C-s>", "<Cmd>Telescope grep_string<CR>", opt)
nmap("n", "<C-q>", "<Cmd>Lspsaga hover_doc<CR>", opt)
nmap("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opt)
nmap("n", "<C-f>", "<Cmd>lua require('conform').format()<CR>", opt)
nmap("n", "<C-S-f>", "<Cmd>Telescope filetypes<CR>", opt)
nmap("n", "<C-c>", "<Cmd>Commentary<CR>", opt)
nmap("v", "<C-c>", ":'<,'>Commentary<CR>", opt)
nmap("n", "<C-S-r>", "<Cmd>source $MYVIMRC<CR>", opt)
nmap("n", "<C-d>", "<Cmd>Telescope diagnostics<CR>", opt)
-- barbar
-- nmap("n", "<C-S-h>", "<Cmd>BufferPrevious<CR>", opt)
-- nmap("n", "<S-Left>", "<Cmd>BufferPrevious<CR>", opt)
-- nmap("n", "<C-S-l>", "<Cmd>BufferNext<CR>", opt)
-- nmap("n", "<S-Right>", "<Cmd>BufferNext<CR>", opt)
-- nmap("n", "<C-S-q>", "<Cmd>BufferClose<CR>", opt)
nmap("n", "<C-S-l>", "<Cmd>Noice telescope<CR>", opt)
nmap("n", "<S-Right>", "<Cmd>Noice telescope<CR>", opt)
-- lspsaga
nmap("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opt)
nmap("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opt)
nmap("n", "gr", "<Cmd>Lspsaga rename<CR>", opt)
vim.keymap.set({ "v", "n" }, "<C-a>", require("actions-preview").code_actions)
-- nmap({ "v", "n" }, "<C-a>", require("actions-preview").code_actions, opt)
nmap("n", "ge", "<Cmd>Lspsaga show_line_diagnostics<CR>", opt)
nmap("n", "[e", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opt)
nmap("n", "]e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opt)
-- Fern
nmap("n", "<C-n>", "<Cmd>FernToggle<CR>", opt)
-- Telescope
nmap("n", "<C-m>", "<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR><ESC>", opt)
nmap("n", "<C-S-m>", "<Cmd>Telescope frecency<CR><ESC>", opt)
nmap("n", "<C-.>", "<Cmd>Telescope symbols<CR>", opt)
nmap("i", "<C-.>", "<Cmd>Telescope symbols<CR>", opt)
-- Git Gutter
nmap("n", "g[", "<Cmd>GitGutterPrevHunk<CR>", opt)
nmap("n", "g]", "<Cmd>GitGutterNextHunk<CR>", opt)
nmap("n", "gh", "<Cmd>GitGutterLineHighlightsToggle<CR>", opt)
-- LazyGit
nmap("n", "gg", "<Cmd>LazyGit<CR>", opt)
-- Conflict nvim
nmap("n", "ck", "<Cmd>GitConflictChooseOurs<CR>", opt)
nmap("n", "cj", "<Cmd>GitConflictChooseTheirs<CR>", opt)
nmap("n", "cc", "<Cmd>GitConflictNextConflict<CR>", opt)
nmap("n", "cx", "<Cmd>GitConflictPrevConflict<CR>", opt)

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

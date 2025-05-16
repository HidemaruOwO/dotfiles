local opt = { silent = true, noremap = true }
local opt_expr = { silent = true, noremap = true, expr = true }

vim.api.nvim_set_keymap("n", "<C-c>", "<Cmd>CommentToggle<CR>", opt)
vim.api.nvim_set_keymap("v", "<C-c>", ":'<,'>CommentToggle<CR>", opt)
-- telescope
vim.api.nvim_set_keymap("n", "<C-s>", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-m>", "<Cmd>Telescope file_browser path=%:p:h select_buffer=true<CR><ESC>", opt)
vim.api.nvim_set_keymap("n", "<C-S-m>", "<Cmd>Telescope frecency<CR><ESC>", opt)
vim.api.nvim_set_keymap("n", "<C-.>", "<Cmd>Telescope symbols<CR>", opt)
vim.api.nvim_set_keymap("i", "<C-.>", "<Cmd>Telescope symbols<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-t>", "<Cmd>ToggleTerm<CR>", opt)
vim.api.nvim_set_keymap("n", "gg", "<Cmd>LazyGit<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-q>", "<Cmd>Lspsaga hover_doc<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-S-q>", "<Cmd>Lspsaga peek_definition<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opt)
vim.api.nvim_set_keymap("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opt)
vim.api.nvim_set_keymap("n", "gp", "<Cmd>Lspsaga preview_definition<CR>", opt)
vim.api.nvim_set_keymap("n", "gr", "<Cmd>Lspsaga rename<CR>", opt)
vim.api.nvim_set_keymap("n", "ge", "<Cmd>Lspsaga show_line_diagnostics<CR>", opt)
vim.api.nvim_set_keymap("n", "[e", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opt)
vim.api.nvim_set_keymap("n", "]e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opt)

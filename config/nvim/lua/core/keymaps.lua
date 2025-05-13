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

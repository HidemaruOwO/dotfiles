vim.cmd([[runtime ./autoload/jetpack.vim]])

-- SpaceをLeaderキーに設定
vim.g.mapleader = " "

-- load core
require("core.options")
require("core.keymaps")
require("core.commands")
require("core.filetypes")
require("core.lsp")

-- load plugins
require("plugins.jetpack")

require("core.colors")

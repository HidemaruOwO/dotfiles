vim.o.termguicolors = true
vim.cmd [[runtime ./autoload/jetpack.vim]]
-- Plugin
require("plugin/install")
require("plugin/settings")
-- Other
require("base")
require("scheme")
require("commands")
require("maps")
require("autocmds")
require("options")

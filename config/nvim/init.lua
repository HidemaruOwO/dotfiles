vim.cmd([[runtime ./autoload/jetpack.vim]])

-- load core
require("core.options")
require("core.keymaps")
require("core.commands")

-- load plugins
require("plugins.jetpack")

require("core.colors")

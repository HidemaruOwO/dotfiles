vim.cmd([[runtime ./autoload/jetpack.vim]])

-- load core
require("core.options")
require("core.keymaps")

-- load plugins
require("plugins.jetpack")

require("core.colors")

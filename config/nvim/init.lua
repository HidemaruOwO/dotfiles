vim.cmd([[runtime ./autoload/jetpack.vim]])

-- load core
require("core.options")
require("core.keymaps")
require("core.commands")
require("core.filetypes")

-- load plugins
require("plugins.jetpack")

require("core.colors")

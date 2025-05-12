vim.o.termguicolors = true
vim.cmd([[runtime ./autoload/jetpack.vim]])
-- Plugin
require("plugin/install")

local pluginSettingsDir = vim.fn.stdpath("config") .. "/lua/plugin/settings"

local function require_all_files_in_directory(directory)
	local files = vim.fn.glob(directory .. "/*.lua", false, true)
	for _, file in ipairs(files) do
		local module_name = file:match("^.+/(.+)$"):gsub("%.lua", "")
		require("plugin.settings." .. module_name)
	end
end

require_all_files_in_directory(pluginSettingsDir)

-- Other
require("variables")
require("base")
require("scheme")
require("commands")
require("maps")
require("autocmds")
require("options")
require("filetypes")

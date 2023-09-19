local telescope = require("telescope")
local fb_act = telescope.extensions.file_browser.actions
-- Load extensions
telescope.load_extension("fzf")
telescope.load_extension("frecency")
telescope.load_extension("media_files")
telescope.load_extension("file_browser")
-- Setup telescope
telescope.setup({
	defaults = {
		borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		-- file_browser = {
		-- 	hijack_netrw = true,
		-- 	mappings = {
		-- 		["n"] = {
		-- 			["<CR>"] = fb_act.open,
		-- 			["c"] = fb_act.create,
		-- 			["m"] = fb_act.move,
		-- 			["d"] = fb_act.remove,
		-- 			["r"] = fb_act.rename,
		-- 			["."] = fb_act.toggle_hidden,
		-- 		},
		-- 	},
		-- },
	},
})

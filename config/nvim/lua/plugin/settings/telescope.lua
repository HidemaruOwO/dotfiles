local telescope = require("telescope")
local act = require("telescope.actions")
local fb_act = telescope.extensions.file_browser.actions
-- Load extensions
telescope.load_extension("fzf")
telescope.load_extension("media_files")
telescope.load_extension("file_browser")
-- Setup telescope
telescope.setup({
	defaults = {
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		mappings = {
			i = {
				["C-s"] = act.select_vertical,
				["C-S-s"] = act.select_horizontal,
			},
			n = {
				["s"] = act.select_vertical,
				["S"] = act.select_horizontal,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		},
		file_browser = {
			hijack_netrw = true,
			mappings = {
				["n"] = {
					f = false,
					["<CR>"] = fb_act.open,
					["n"] = fb_act.create,
					["m"] = fb_act.move,
					["d"] = fb_act.remove,
					["r"] = fb_act.rename,
					["."] = fb_act.toggle_hidden,
					["s"] = false,
				},
			},
		},
	},
})

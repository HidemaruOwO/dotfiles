vim.opt.runtimepath:append("~/dotfiles/templates/treesitter")

-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
--ft_to_parser.mdx = "tsx"
-- Nvim 0.10.0
-- vim.treesitter.language.register("mdx", "tsx")

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	sync_install = false,

	auto_install = true,

	-- ignore filetypes
	ignore_install = { "astro" },

	parser_install_dir = "~/dotfiles/templates/treesitter",
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
	autotag = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.hypr = {
	install_info = {
		url = "https://github.com/luckasRanarison/tree-sitter-hypr",
		files = { "src/parser.c" },
		branch = "master",
	},
	filetype = "hypr",
}

vim.treesitter.language.register("tsx", { "mdx" })

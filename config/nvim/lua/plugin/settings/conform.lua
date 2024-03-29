local prettier = { "prettierd", "prettier" }
local rustfmt = require("conform.formatters.rustfmt")
rustfmt.args = function()
	return { "--edition", "2021", "--emit", "stdout" }
end

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		astro = { prettier },
		javascript = { prettier },
		typescript = { prettier },
		javascriptreact = { prettier },
		typescriptreact = { prettier },
		css = { prettier },
		html = { prettier },
		json = { prettier },
		jsonc = { prettier },
		yaml = { prettier },
		markdown = { prettier },
		graphql = { prettier },
		scss = { prettier },
		sh = { "shfmt" },
		bash = { "shfmt" },
		fish = { "fish_indent" },
		rust = { "rustfmt" },
		go = { "gofmt" },
		zig = { "zigfmt" },
		["*"] = { "trim_whitespace", "trim_newlines" },
		-- ["_"] = { "trim_whitespace", "trim_newlines", "codespell" },
	},
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 500,
	},
})

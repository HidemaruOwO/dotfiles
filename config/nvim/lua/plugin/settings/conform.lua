local web_formatter = { "biome-check", "prettierd", "prettier", stop_after_first = true }
local rustfmt = require("conform.formatters.rustfmt")
rustfmt.args = function()
	return { "--edition", "2021", "--emit", "stdout" }
end

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		astro = { "prettier" },
		javascript = web_formatter,
		typescript = web_formatter,
		javascriptreact = web_formatter,
		typescriptreact = web_formatter,
		css = web_formatter,
		html = web_formatter,
		json = web_formatter,
		jsonc = web_formatter,
		yaml = web_formatter,
		markdown = web_formatter,
		graphql = web_formatter,
		scss = web_formatter,
		mdx = { "prettier" },
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

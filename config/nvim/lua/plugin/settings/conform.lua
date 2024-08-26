local jsfmt = { "biome", "prettierd", "prettier", stop_after_first = true }
local rustfmt = require("conform.formatters.rustfmt")
rustfmt.args = function()
	return { "--edition", "2021", "--emit", "stdout" }
end

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		astro = jsfmt,
		javascript = jsfmt,
		typescript = jsfmt,
		javascriptreact = jsfmt,
		typescriptreact = jsfmt,
		css = jsfmt,
		html = jsfmt,
		json = jsfmt,
		jsonc = jsfmt,
		yaml = jsfmt,
		markdown = jsfmt,
		graphql = jsfmt,
		scss = jsfmt,
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

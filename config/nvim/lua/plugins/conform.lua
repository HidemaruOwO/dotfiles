local web_formatter = { "prettier", stop_after_first = true }

local web_filetypes = {
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"css",
	"html",
	"json",
	"jsonc",
	"yaml",
	"markdown",
	"graphql",
	"scss",
}

local formatters_by_ft = {
	lua = { "stylua" },
	python = { "isort", "black" },
	astro = { "prettier" },
	mdx = { "prettier" },
	sh = { "shfmt" },
	bash = { "shfmt" },
	fish = { "fish_indent" },
	rust = { "rustfmt" },
	go = { "gofmt" },
	zig = { "zigfmt" },
	["*"] = { "trim_whitespace", "trim_newlines" },
	-- ["_"] = { "trim_whitespace", "trim_newlines", "codespell" },
}

for _, ft in ipairs(web_filetypes) do
	formatters_by_ft[ft] = web_formatter
end

-- configure language
local rustfmt = require("conform.formatters.rustfmt")
rustfmt.args = function()
	return { "--edition", "2021", "--emit", "stdout" }
end

require("conform").setup({
	formatters_by_ft = formatters_by_ft,
	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 500,
	},
})

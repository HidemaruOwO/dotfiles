vim.cmd("set signcolumn=yes")

local signs = { Error = "", Warn = "", Hint = "💡", Info = "" }
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		enable = true,
		text = {
			["ERROR"] = signs.Error,
			["WARN"] = signs.Warn,
			["HINT"] = signs.Hint,
			["INFO"] = signs.Info,
		},
		texthl = {
			["ERROR"] = "DiagnosticDefault",
			["WARN"] = "DiagnosticDefault",
			["HINT"] = "DiagnosticDefault",
			["INFO"] = "DiagnosticDefault",
		},
		numhl = {
			["ERROR"] = "DiagnosticDefault",
			["WARN"] = "DiagnosticDefault",
			["HINT"] = "DiagnosticDefault",
			["INFO"] = "DiagnosticDefault",
		},
		severity_sort = true,
	},
})

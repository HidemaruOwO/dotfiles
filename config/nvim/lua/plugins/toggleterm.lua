require("toggleterm").setup({
	direction = "float",
	float_opts = {
		border = "rounded",
		width = function(term)
			return math.floor(vim.o.columns * 0.9)
		end,
		height = function(term)
			return math.floor(vim.o.lines * 0.9)
		end,
	},
})

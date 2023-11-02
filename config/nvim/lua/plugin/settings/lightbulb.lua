require("nvim-lightbulb").setup({
	autocmd = { enabled = true },
	priority = 10,
	link_highlights = true,
	validate_config = "auto",
	sign = {
		enabled = true,
		text = "",
		hl = "LightBulbSign",
	},
	virtual_text = {
		enabled = false,
	},
	float = {
		enabled = false,
	},
	number = {
		enabled = true,
		hl = "LightBulbNumber",
	},
	line = {
		enabled = false,
	},
})

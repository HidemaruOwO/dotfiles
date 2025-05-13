vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "gray", bg = "NONE" })
	end,
})

if vim.fn.has("termguicolors") == 1 then
	vim.opt.termguicolors = true
end

vim.opt.background = "dark"

vim.cmd("syntax enable")

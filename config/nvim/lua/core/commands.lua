vim.api.nvim_create_user_command("ToggleTerm", function()
	local Terminal = require("toggleterm.terminal").Terminal
	local term = Terminal:new({
		cmd = "fish",
		hidden = true,
		float_opts = {
			border = "rounded",
		},
		direction = "float",
		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		-- function to run on closing the terminal
		on_close = function(term)
			vim.cmd("startinsert!")
		end,
	})
	term:toggle()
end, {})

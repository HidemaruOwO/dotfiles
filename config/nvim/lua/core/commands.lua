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

local function show_slime_greeting()
	local slime_art = {
		"        ∩─────────∩",
		"       (  ◕     ◕  )",
		"      /   ＞   ＜   \\",
		"     (  ~~~~~~~~~~~~~~~~ )",
		"    (                    )",
		"     (  ~~~~~~~~~~~~~~~~ )",
		"      \\               /",
		"       \\─────────────/",
		"         ~~     ~~",
		"",
		"    Hello, I'm HidemaruOwO!!",
		"       Have a nice day!",
	}

	-- 新しいバッファを作成
	local buf = vim.api.nvim_create_buf(false, true)

	-- アスキーアートをバッファに設定
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, slime_art)

	-- ウィンドウの設定
	local width = 35
	local height = #slime_art
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = (vim.o.columns - width) / 2,
		row = (vim.o.lines - height) / 2,
		style = "minimal",
		border = "rounded",
		title = " PuyoPuyo Slime ",
		title_pos = "center",
	})

	-- バッファの設定
	vim.api.nvim_buf_set_option(buf, "modifiable", false)
	vim.api.nvim_buf_set_option(buf, "buftype", "nofile")

	-- ESCキーまたはqキーで閉じる
	vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", ":close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })

	-- 3秒後に自動で閉じる
	vim.defer_fn(function()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, false)
		end
	end, 3000)
end

-- コマンドを作成
vim.api.nvim_create_user_command("SlimeGreeting", show_slime_greeting, {})

vim.api.nvim_create_user_command("OpenCode", function()
	local ok, opencode = pcall(require, "opencode")
	if not ok then
		vim.notify("Failed to load opencode module", vim.log.levels.ERROR)
		return
	end
	opencode.toggle()
end, {
	desc = "Toggle OpenCode",
})

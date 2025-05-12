-- require("actions-preview").setup({
-- 	diff = {
-- 		algorithm = "patience",
-- 		ignore_whitespace = true,
-- 	},
-- 	telescope = require("telescope.themes").get_dropdown({ winblend = 10 }),
-- })
require("actions-preview").setup({
	diff = {
		-- algorithm = "myers", -- デフォルト
		-- algorithm = "minimal", -- 時間が掛かるができるだけ小さい差分を生成する
		-- algorithm = "patience", -- 賢めなアルゴリズムのpatienceを使用する
		algorithm = "histogram", -- patienceとほぼ同じ結果だが速いらしい

		-- 差分がある部分の前後に表示する行数。git diff --unified=<n>相当
		ctxlen = 3,
		-- 同一ファイルの差分塊間の行数がこれ以下なら全部表示する。git diff --inter-hunk-context=<lines>相当
		interhunkctxlen = 0,

		-- あらゆるスペースの変更を無視する。trueならgit diff --ignore-all-space相当
		ignore_whitespace = true,
		-- 行頭や連続するスペースの変更を無視する。trueならgit diff --ignore-space-change相当
		ignore_whitespace_change = true,
		-- 行末スペースの変更を無視する。trueならgit diff --ignore-space-at-eol相当
		ignore_whitespace_change_at_eol = true,
		-- 改行前のCR（\r）を無視する。trueならgit diff --ignore-cr-at-eol相当
		-- ignore_cr_at_eol = false,
		-- 連続した空行の変更を無視する。trueならgit diff --ignore-blank-lines相当
		-- ignore_blank_lines = false,
		-- 差分のズレを抑制する。trueならgit diff --indent-heuristic相当。actions-preview.nvimではデフォルト無効
		indent_heuristic = true,
	},
	backend = { "telescope" },
	telescope = vim.tbl_extend("force", require("telescope.themes").get_dropdown(), {
		make_value = nil,
		make_make_display = nil,
	}),
})

-- require("lsp_lines").setup()
-- vim.lsp.handlers["textDocument/publishDiagnostics"] =
--      vim.lsp.with(
--      vim.lsp.diagnostic.on_publish_diagnostics,
--      {
--          virtual_text = true、
--      }
--  )
--
require("diagflow").setup({
	-- placement = "inline",
	toggle_event = { "InsertEnter", "InsertLeave" },

	everity_colors = { -- The highlight groups to use for each diagnostic severity level
		error = "DiagnosticFloatingError",
		warning = "DiagnosticFloatingWarn",
		info = "DiagnosticFloatingInfo",
		hint = "DiagnosticFloatingHint",
	},
	border_chars = {
		top_left = "╭",
		top_right = "╮",
		bottom_left = "╰",
		bottom_right = "╯",
		horizontal = "─",
		vertical = "│",
	},
	show_borders = true,
	scope = "line",
	gap_size = 1,
})

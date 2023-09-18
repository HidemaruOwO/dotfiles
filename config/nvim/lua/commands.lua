local api = vim.api

api.nvim_create_user_command("FernToggle", "Fern . -reveal=% -drawer -toggle -width=33", {})
api.nvim_create_user_command("DduFiler", 'call ddu#start({ "name": "filer", "searchPath": expand("%:p") })', {})
api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

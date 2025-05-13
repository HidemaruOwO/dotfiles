local noice = require("noice")

local function view(pattern, kind)
	kind = kind or ""
	return {
		view = "mini",
		filter = {
			event = "msg_show",
			kind = kind,
			find = pattern,
		},
	}
end

local mini_view_patterns = {
	{ "Already at .* change" },
	{ "written" },
	{ "yanked" },
	{ "more lines?" },
	{ "fewer lines?" },
	{ "fewer lines?", "lua_error" },
	{ "change; before" },
	{ "change; after" },
	{ "line less" },
	{ "lines indented" },
	{ "No lines in buffer" },
	{ "search hit .*, continuing at", "wmsg" },
	{ "E486: Pattern not found", "emsg" },
}

local routes = {
	{
		filter = {
			event = "notify",
			warning = true,
			find = "failed to run generator.*is not executable",
		},
		opts = { skip = true },
	},
}

for _, p_config in ipairs(mini_view_patterns) do
	table.insert(routes, view(p_config[1], p_config[2]))
end

noice.setup({
	messages = {
		view_search = "mini",
	},
	routes = routes,
})

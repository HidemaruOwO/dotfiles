-- configure mason.nvim
require("mason").setup({
	ui = {
		border = "rounded",
	},
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local servers = {
	denols = {
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json"),
		lint = true,
		unstable = true,
		suggest = {
			imports = {
				hosts = {
					["https://deno.land"] = true,
					["https://cdn.nest.land"] = true,
					["https://crux.land"] = true,
				},
			},
		},
	},
	tsserver = {
		root_dir = lspconfig.util.root_pattern("package.json"),
		init_options = {
			hostInfo = "neovim",
			maxTsServerMemory = 4096,
			tsserver = { useSyntaxServer = "never" },
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = {
						"vim",
						"require",
					},
				},
				workspace = {
					library = vim.api.nvim_get_runtime_file("", true),
				},
				telemetry = {
					enable = false,
				},
			},
		},
	},
}

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local server_specific_config = servers[server_name] or {}
			local server_options = vim.tbl_deep_extend("force", { capabilities = capabilities }, server_specific_config)
			lspconfig[server_name].setup(server_options)
		end,
	},
})

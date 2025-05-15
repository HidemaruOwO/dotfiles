-- configure mason.nvim
require("mason").setup({
	ui = {
		border = "rounded",
	},
})

-- configure lspconfig
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")

local servers = {
	denols = {
		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json"),
		capabilities = capabilities,
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
		capabilities = capabilities,
	},
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					lcallSinppet = "Replace",
				},
			},
		},
	},
	-- zls = {
	-- 	root_dir = lspconfig.util.root_pattern("build.zig"),
	-- 	cmd = { "/usr/bin/zls" },
	-- 	capabilities = capabilities,
	-- },
}

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local server_config = servers[server_name] or {}
			-- capabilities をすべてのサーバーのデフォルト設定としてマージ
			local final_config = vim.tbl_deep_extend("force", { capabilities = capabilities }, server_config)
			lspconfig[server_name].setup(final_config)
		end,
	},
})

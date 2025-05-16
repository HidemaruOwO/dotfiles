-- configure mason.nvim
require("mason").setup({
	ui = {
		border = "rounded",
	},
})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--
-- capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
-- local lspconfig = require("lspconfig")

-- local servers = {
-- 	denols = {
-- 		root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json"),
-- 		capabilities = capabilities,
-- 		lint = true,
-- 		unstable = true,
-- 		suggest = {
-- 			imports = {
-- 				hosts = {
-- 					["https://deno.land"] = true,
-- 					["https://cdn.nest.land"] = true,
-- 					["https://crux.land"] = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- 	tsserver = {
-- 		root_dir = lspconfig.util.root_pattern("package.json"),
-- 		init_options = {
-- 			hostInfo = "neovim",
-- 			maxTsServerMemory = 4096,
-- 			tsserver = { useSyntaxServer = "never" },
-- 		},
-- 		capabilities = capabilities,
-- 	},
-- 	lua_ls = {
-- 		settings = {
-- 			Lua = {
-- 				completion = {
-- 					lcallSinppet = "Replace",
-- 				},
-- 			},
-- 		},
-- 	},
-- 	-- zls = {
-- 	-- 	root_dir = lspconfig.util.root_pattern("build.zig"),
-- 	-- 	cmd = { "/usr/bin/zls" },
-- 	-- 	capabilities = capabilities,
-- 	-- },
-- }

-- require("mason-lspconfig").setup({
-- 	handlers = {
-- 		function(server_name)
-- 			local server_config = servers[server_name] or {}
-- 			-- capabilities をすべてのサーバーのデフォルト設定としてマージ
-- 			local final_config = vim.tbl_deep_extend("force", { capabilities = capabilities }, server_config)
-- 			lspconfig[server_name].setup(final_config)
-- 		end,
-- 	},
-- })

-- configure lspconfig
require("mason-lspconfig").setup({
	handlers = function(server)
		local opt = {
			-- -- Function executed when the LSP server startup
			-- on_attach = function(client, bufnr)
			--   local opts = { noremap=true, silent=true }
			--   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
			--   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
			-- end,
			capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		}
		require("lspconfig")[server].setup(opt)
	end,
})

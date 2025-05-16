local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
	vim.notify("cmp not found", vim.log.levels.WARN)
	return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
	vim.notify("lspkind not found for cmp", vim.log.levels.WARN)
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	vim.notify("luasnip not found for cmp", vim.log.levels.WARN)
end

local has_copilot, copilot = pcall(require, "copilot.suggestion")
if not has_copilot then
	vim.notify("copilot.suggestion not found for cmp", vim.log.levels.INFO)
end

-- The following options are generally recommended for nvim-cmp
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- Removed noinsert

-- Highlight group for CmpItemKind similar to CmpItemMenuDefault
vim.api.nvim_set_hl(0, "CmpItemKind", { link = "CmpItemMenuDefault" })

cmp.setup({
	snippet = {
		expand = function(args)
			if luasnip then
				require("luasnip/loaders/from_vscode").lazy_load({
					paths = {
						vim.fn.stdpath("data") .. "/site/pack/jetpack/opt/friendly-snippets",
						"./snippets",
					},
				})
				luasnip.lsp_expand(args.body)
			end
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(), -- Changed from close() to abort() for consistency
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip and luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip and luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "copilot" },
	}),
	formatting = {
		format = lspkind_status_ok
				and lspkind.cmp_format({
					mode = "symbol_text", -- Changed from "symbol"
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = {
						Copilot = "",
						Text = "  ",
						Method = "  ",
						Function = " 󰊕 ",
						Constructor = "  ",
						Field = " 󰽏 ",
						Variable = " 󰫧 ",
						Class = "  ",
						Interface = "  ",
						Module = "  ",
						Property = " ⅊ ",
						Unit = " ◫ ",
						Value = "  ",
						Enum = "  ",
						Keyword = "  ",
						Snippet = "  ",
						Color = "  ",
						File = " 󰈔 ",
						Reference = "  ",
						Folder = " 󰉋 ",
						EnumMember = "  ",
						Constant = "  ",
						Struct = "  ",
						Event = "  ",
						Operator = " ∏ ",
						TypeParameter = "  ",
					},
					-- menu = {
					-- 	buffer = "[Buffer]",
					-- 	nvim_lsp = "[LSP]",
					-- 	luasnip = "[LuaSnip]",
					-- 	nvim_lua = "[Lua]",
					-- 	copilot = "[Copilot]",
					-- },
				})
			or nil,
	},
	window = {
		completion = cmp.config.window.bordered({
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		}),
		documentation = cmp.config.window.bordered({
			border = "rounded",
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
		}),
	},
	experimental = {
		ghost_text = false, -- Consider enabling if you like ghost text
	},
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" },
	}, {
		{ name = "buffer" },
	}),
})

local markdown_filetypes = { "markdown", "mdx" }

for _, ft in ipairs(markdown_filetypes) do
	cmp.setup.filetype(ft, {
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		}),
	})
end

-- Use buffer source for `/`
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

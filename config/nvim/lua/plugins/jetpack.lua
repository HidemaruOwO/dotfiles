vim.cmd("packadd vim-jetpack")

require("jetpack.packer").add({
	{ "tani/vim-jetpack" }, -- bootstrap

	-- ======= Core =======
	{
		"christoomey/vim-system-copy",
		event = "ModeChanged",
	}, -- copy to clipboard
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("plugins.conform")
			require("conform").format()
		end,
	}, -- formatter
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		requires = {
			"kyazdani42/nvim-web-devicons",
			-- "lewis6991/gitsigns.nvim",
		},
		config = function()
			require("lualine").setup({
				options = { theme = "everforest" },
			})
		end,
	}, -- status line always loading
	{
		"tummetott/reticle.nvim",
		event = "VimEnter",
		config = function()
			require("plugins.reticle")
		end,
	}, -- decorate buffers writing
	{
		"folke/noice.nvim",
		event = "VimEnter",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("plugins.noice")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "VimEnter" },
		run = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	-- ======= Color Scheme ====
	-- use({ "Rigellute/rigel" })
	{
		"sainnhe/everforest",
		config = function()
			vim.cmd([[colorscheme everforest]])
		end,
	},
	-- use({ "joshdick/onedark.vim" })
	-- { "morhetz/gruvbox" },
	-- use({ "KKPMW/moonshine-vim" })
	-- use({ "AlessandroYorba/Alduin" })
	-- use({ "w0ng/vim-hybrid" })
	-- use({ "nanotech/jellybeans.vim" })
	-- use({ "altercation/solarized" })
	-- use({ "tomasr/molokai" })
	--
	-- ======= LSP =======
	{
		"neovim/nvim-lspconfig",
		event = { "BufNewFile", "BufReadPre", "InsertEnter", "CmdLineEnter" },
		config = function()
			require("plugins.lspconfig")
		end,
		requires = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			{
				"hrsh7th/nvim-cmp",
				config = function()
					require("plugins.cmp")
				end,
				requires = {
					-- cmp sources
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-cmdline",
					"petertriho/cmp-git",
					"saadparwaiz1/cmp_luasnip",
					{
						"zbirenbaum/copilot-cmp",
						after = { "copilot.lua" },
						config = function()
							require("copilot_cmp").setup()
						end,
					},
					-- cmp deps
					"onsails/lspkind.nvim",
					{
						"L3MON4D3/LuaSnip",
						run = "make install_jsregexp",
						-- add snippets
						requires = {
							"rafamadriz/friendly-snippets",
						},
					}, -- snippets manager
					{
						"zbirenbaum/copilot.lua",
						config = function()
							require("plugins.copilot")
						end,
					},
				},
			}, -- nvim cmp
		},
	},
	-- ======= Denops =======
	--
	-- ======= Advanced =======
	{
		-- "~/code/mdxsnap.nvim",
		"HidemaruOwO/mdxsnap.nvim",
		cmd = "PasteImage",
		ft = { "markdown", "mdx" },
		config = function()
			require("plugins.mdxsnap")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }, -- fzf on telescope
			{ "nvim-telescope/telescope-symbols.nvim" }, -- view emojis and symbols
			{ "nvim-telescope/telescope-media-files.nvim" }, -- image viewer
			{ "nvim-telescope/telescope-frecency.nvim" }, -- search files by keywords
			{ "HidemaruOwO/telescope-file-browser.nvim" }, -- file manager
		},
		config = function()
			require("plugins.telescope")
		end,
	}, -- telescope
	{
		"terrortylor/nvim-comment",
		cmd = "CommentToggle",
		config = function()
			require("nvim_comment").setup()
		end,
		-- cmp deps
	}, -- quick comment
	{
		"windwp/nvim-autopairs",
		event = { "BufNewFile", "BufReadPre", "InsertEnter" },
		config = function()
			require("nvim-autopairs").setup()
		end,
	}, -- double quote utils
	{
		"windwp/nvim-ts-autotag",
		event = { "BufNewFile", "BufReadPre", "InsertEnter" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	}, -- html tag utils
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("gitsigns").setup()
		end,
	}, -- show git status
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		config = function()
			require("plugins.toggleterm")
		end,
	}, -- summon terminal
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("colorizer").setup()
		end,
	}, -- view colors
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		requires = {
			"nvim-lua/plenary.nvim",
		},
	}, -- lazygit
})

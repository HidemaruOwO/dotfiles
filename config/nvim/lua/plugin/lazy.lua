local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "folke/lazy.nvim", lazy = false, priority = 1000 },
	{
		"christoomey/vim-system-copy",
		event = "ModeChanged",
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("plugins.conform")
			require("conform").format()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			-- "lewis6991/gitsigns.nvim",
		},
		config = function()
			require("lualine").setup({
				options = { theme = "everforest" },
			})
		end,
	},
	{
		"tummetott/reticle.nvim",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("plugins.reticle")
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("plugins.noice")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("ibl").setup({
				indent = {
					char = "▏",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false, -- upstream notes Treesitter itself is not lazy-load friendly
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme everforest]])
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufNewFile", "BufReadPre" },
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-cmdline",
					"petertriho/cmp-git",
					"saadparwaiz1/cmp_luasnip",
					"onsails/lspkind.nvim",
					{
						"L3MON4D3/LuaSnip",
						build = "make install_jsregexp",
						dependencies = {
							"rafamadriz/friendly-snippets",
						},
					},
					{
						"zbirenbaum/copilot.lua",
						config = function()
							require("plugins.copilot")
						end,
					},
					{
						"zbirenbaum/copilot-cmp",
						dependencies = { "zbirenbaum/copilot.lua" },
						config = function()
							require("copilot_cmp").setup()
						end,
					},
				},
				config = function()
					require("plugins.cmp")
				end,
			},
		},
		config = function()
			require("plugins.lspconfig")
		end,
	},
	{
		"dgagn/diagflow.nvim",
		event = "LspAttach",
		config = function()
			require("plugins.diagflow")
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		cmd = "Lspsaga",
		event = "LspAttach",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.lspsaga")
		end,
	},
	{
		"vim-denops/denops.vim",
		event = "VimEnter",
		dependencies = {
			{
				"vim-denops/denops-helloworld.vim",
			},
			{
				"kat0h/bufpreview.vim",
				build = "deno task prepare",
			},
		},
	},
	{
		"NickvanDyke/opencode.nvim",
		event = "VimEnter",
		dependencies = {
			"folke/snacks.nvim",
		},
	},
	{
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
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{ "nvim-telescope/telescope-symbols.nvim" },
			{ "nvim-telescope/telescope-media-files.nvim" },
			{ "nvim-telescope/telescope-frecency.nvim" },
			{ "HidemaruOwO/telescope-file-browser.nvim" },
		},
		config = function()
			require("plugins.telescope")
		end,
	},
	{
		"terrortylor/nvim-comment",
		cmd = "CommentToggle",
		config = function()
			require("nvim_comment").setup()
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufNewFile", "BufReadPre", "InsertEnter" },
		config = function()
			require("plugins.autotag")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		config = function()
			require("plugins.toggleterm")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufNewFile", "BufReadPre" },
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{ "wakatime/vim-wakatime", event = "VimEnter" },
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatStop",
			"CopilotChatReset",
			"CopilotChatSave",
			"CopilotChatLoad",
			"CopilotChatPrompts",
			"CopilotChatModels",
			"CopilotChatExplain",
			"CopilotChatReview",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatDocs",
			"CopilotChatTests",
			"CopilotChatCommit",
		},
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		config = function()
			require("CopilotChat").setup()
		end,
	},
}

local opts = {}

require("lazy").setup(plugins, opts)

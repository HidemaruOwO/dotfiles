function getHostname()
	local f = io.open("/etc/hostname", "r")
	for line in f:lines() do
		return line
	end
end

require("jetpack.packer").startup(function(use)
	-- bootstrap
	use({ "tani/vim-jetpack", opt = 1 })
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- =========== Language Jetpackins ===========
	-- Zig
	use({ "ziglang/zig.vim" })
	-- Nim
	use({ "alaviss/nim.nvim" })
	-- MarkDown
	use({ "previm/previm" })
	use({ "mattn/vim-maketable" })
	-- Fish
	use({ "dag/vim-fish" })
	-- Astro
	use({ "wuelnerdotexe/vim-astro" })
	-- =========== Color Scheme ===========
	use({ "Rigellute/rigel" })
	use({ "sainnhe/everforest" })
	use({ "joshdick/onedark.vim" })
	use({ "morhetz/gruvbox" })
	use({ "KKPMW/moonshine-vim" })
	use({ "AlessandroYorba/Alduin" })
	use({ "w0ng/vim-hybrid" })
	use({ "nanotech/jellybeans.vim" })
	use({ "altercation/solarized" })
	use({ "tomasr/molokai" })
	-- =========== Tools ===========
	-- Copilot
	use({ "zbirenbaum/copilot.lua" })
	-- Transparent background
	use({ "miyakogi/seiya.vim" })
	-- Change vimdoc language to Japanese
	use({ "vim-jp/vimdoc-ja" })
	-- Builtin LSP
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "nvimdev/lspsaga.nvim" })
	use({ "onsails/lspkind.nvim" })
	use({ "ray-x/lsp_signature.nvim" })
	use({ "dgagn/diagflow.nvim" })
	use({ "j-hui/fidget.nvim" })
	-- Code actions
	use({ "aznhe21/actions-preview.nvim" })
	-- Format code from LSP
	use({ "stevearc/conform.nvim" })
	-- Cmp completion
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "zbirenbaum/copilot-cmp" })
	-- Preview replace
	use({ "segeljakt/vim-silicon" })
	use({ "markonm/traces.vim" })
	-- Tree Sitter modules
	use({ "luckasRanarison/tree-sitter-hypr" })
	-- use { 'p00f/nvim-ts-rainbow' }
	use({ "https://gitlab.com/HiPhish/rainbow-delimiters.nvim", as = "rainbow-delimiters.nvim" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "windwp/nvim-autopairs" })
	-- Atom icon
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "ryanoasis/vim-devicons" })
	-- Paint indent
	use({ "nathanaelkane/vim-indent-guides" })
	-- Show rich status bar
	use({ "akinsho/bufferline.nvim" })
	use({ "nvim-lualine/lualine.nvim" })
	-- Theme
	use({ "jonathanfilip/vim-lucius" })
	-- ターミナル
	-- use({ "Shougo/deol.nvim" })
	-- use({ "numToStr/FTerm.nvim" })
	use({ "akinsho/toggleterm.nvim" })
	-- Share code at realtime
	use({ "jbyuki/instant.nvim" })
	-- wakatimes plugin
	use({ "wakatime/vim-wakatime" })
	-- 括弧の入力補完
	use({ "cohama/lexima.vim" })
	-- Show Discord activity
	use({ "andweeb/presence.nvim" })
	-- Fuzzy Finder
	use({ "junegunn/fzf" })
	-- use { 'ibhagwan/fzf-lua' }
	-- use { 'junegunn/fzf.vim' }
	-- 一部の行をコピー
	use({ "Rasukarusan/nvim-select-multi-line" })
	use({ "thinca/vim-scouter" })
	-- コンフリクトを協調する
	use({ "rhysd/conflict-marker.vim" })
	use({ "akinsho/git-conflict.nvim" })
	-- Undoの履歴を表示する
	use({ "sjl/gundo.vim" })
	-- File manager
	-- -- Fern
	use({ "lambdalisue/fern.vim" })
	use({ "lambdalisue/fern-git-status.vim" })
	use({ "lambdalisue/glyph-palette.vim" })
	use({ "lambdalisue/nerdfont.vim" })
	use({ "lambdalisue/fern-renderer-nerdfont.vim" })
	use({ "lambdalisue/glyph-palette.vim" })
	-- Git差分表示
	use({ "airblade/vim-gitgutter" })
	-- Comment
	use({ "tpope/vim-commentary" })
	-- quick run
	use({ "Comamoca/runit.nvim" })
	-- Clipboard
	use({ "christoomey/vim-system-copy" })
	-- LazyGit
	use({ "kdheepak/lazygit.nvim" })
	-- Window Decoration
	use({ "nvim-lua/plenary.nvim" })
	use({ "Allianaab2m/vimskey" })
	use({ "stevearc/dressing.nvim" })
	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope-symbols.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	use({ "HidemaruOwO/telescope-file-browser.nvim" })
	--
	use({ "folke/noice.nvim" })
	use({ "MunifTanjim/nui.nvim" })
	use({ "rcarriga/nvim-notify" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "kylechui/nvim-surround" })
	-- カーソルの位置を強調する
	use({ "tummetott/reticle.nvim" })
end)

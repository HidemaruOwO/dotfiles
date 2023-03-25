require("jetpack.packer").startup(function(use)
  -- bootstrap
  use { 'tani/vim-jetpack' }
  -- =========== Language Jetpackins ===========
  -- Any
  use { 'prettier/vim-prettier' }
  -- Nim
  use { 'alaviss/nim.nvim' }
  -- MarkDown
  use { 'previm/previm' }
  use { 'mattn/vim-maketable' }
  -- Fish
  use { 'dag/vim-fish' }
  -- Astro
  use { 'wuelnerdotexe/vim-astro' }
  -- =========== Color Scheme ===========
  use { 'Rigellute/rigel' }
  use { 'joshdick/onedark.vim' }
  use { 'morhetz/gruvbox' }
  -- =========== Tools ===========
  -- Transperent background
  use { 'miyakogi/seiya.vim' }
  -- Change vimdoc language to Japanese
  use { 'vim-jp/vimdoc-ja' }
  -- Builtin LSP
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  use { 'kkharji/lspsaga.nvim' }
  use { 'onsails/lspkind.nvim' }
  use { 'ray-x/lsp_signature.nvim' }
  use { 'j-hui/fidget.nvim' }
  -- Cmp 入力補完
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip' }
  -- Preview replace
  -- Enable Deno
  use { 'vim-denops/denops.vim' }
  -- Generte Image from code
  use { 'skanehira/denops-silicon.vim' }
  use { 'markonm/traces.vim' }
  -- Tree Sitter
  use { 'nvim-treesitter/nvim-treesitter', cmd = ':TSUpdate' }
  use { 'p00f/nvim-ts-rainbow' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'windwp/nvim-autopairs' }
  -- Atom icon
  use { 'ryanoasis/vim-devicons' }
  -- Paint indent
  use { 'nathanaelkane/vim-indent-guides' }
  -- Show rich status bar
  use { 'akinsho/bufferline.nvim' }
  use { 'vim-airline/vim-airline' }
  use { 'vim-airline/vim-airline-themes' }
  -- Theme
  use { 'jonathanfilip/vim-lucius' }
  -- ターミナル
  use { 'Shougo/deol.nvim' }
  -- Writing code with AI
  use { 'github/copilot.vim' }
  -- Share code at realtime
  use { 'jbyuki/instant.nvim' }
  -- wakatimes plugin
  use { 'wakatime/vim-wakatime' }
  -- 括弧の入力補完
  use { 'cohama/lexima.vim' }
  -- Show Discord activity
  use { 'andweeb/presence.nvim' }
  -- Fuzzy Finder
  use { 'junegunn/fzf' }
  use { 'junegunn/fzf.vim' }
  -- 一部の行をコピー
  use { 'Rasukarusan/nvim-select-multi-line' }
  use { 'thinca/vim-scouter' }
  -- コンフリクトを協調する
  use { 'rhysd/conflict-marker.vim' }
  use { 'akinsho/git-conflict.nvim' }
  -- Undoの履歴を表示する
  use { 'sjl/gundo.vim' }
  -- File tree
  use { 'lambdalisue/fern.vim' }
  use { 'lambdalisue/fern-git-status.vim' }
  use { 'lambdalisue/glyph-palette.vim' }
  use { 'lambdalisue/nerdfont.vim' }
  use { 'lambdalisue/fern-renderer-nerdfont.vim' }
  use { 'lambdalisue/glyph-palette.vim' }
  -- Git差分表示
  use { 'airblade/vim-gitgutter' }
  -- Comment
  use { 'tpope/vim-commentary' }
end)

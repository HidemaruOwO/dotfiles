" plugin
call jetpack#begin()
  Jetpack 'tani/vim-jetpack', {'opt': 1} " bootstrap
  " =========== Language Jetpackins ===========
  " Any
  Jetpack 'prettier/vim-prettier'
  " Python
  Jetpack 'python/mypy'
  " Zig
  Jetpack 'ziglang/zig.vim'
  " Nim
  Jetpack 'alaviss/nim.nvim'
  " Rust
  Jetpack 'rust-lang/rust.vim'
  Jetpack 'jonathanfilip/vim-lucius'
  " JavaScript
  Jetpack 'windwp/nvim-ts-autotag'
  Jetpack 'windwp/nvim-autopairs'
  Jetpack 'othree/es.next.syntax.vim'
  Jetpack 'othree/yajs.vim'
  Jetpack 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  " C
  Jetpack 'zchee/deoplete-clang'
  Jetpack 'rhysd/vim-clang-format'
  " Dotnet
  Jetpack 'OmniSharp/omnisharp-vim'
  Jetpack 'neovim/nvim.net'
  " MarkDown
  Jetpack 'previm/previm'
  Jetpack 'mattn/vim-maketable'
  " Fish
  Jetpack 'dag/vim-fish'
  " =========== Color Scheme ===========
  Jetpack 'Rigellute/rigel'
  Jetpack 'joshdick/onedark.vim'
  " =========== Exterior ===========
  " Change vimdoc language to Japanese
  Jetpack 'vim-jp/vimdoc-ja'
  " =========== Tools ===========
  " Builtin LSP
  Jetpack 'neovim/nvim-lspconfig'
  Jetpack 'williamboman/mason.nvim'
  Jetpack 'williamboman/mason-lspconfig.nvim'
  " Cmp 入力補完
  Jetpack 'hrsh7th/cmp-nvim-lsp'
  Jetpack 'hrsh7th/cmp-buffer'
  Jetpack 'hrsh7th/cmp-path'
  Jetpack 'hrsh7th/cmp-cmdline'
  Jetpack 'hrsh7th/nvim-cmp'
  Jetpack 'L3MON4D3/LuaSnip'
  Jetpack 'saadparwaiz1/cmp_luasnip'
" Preview replace
  Jetpack 'markonm/traces.vim'
  " Show directory tree
  Jetpack 'preservim/nerdtree'
  Jetpack 'p00f/nvim-ts-rainbow'
  Jetpack 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Atom icon for NERDTree
  Jetpack 'ryanoasis/vim-devicons'
  " Paint indent
  Jetpack 'nathanaelkane/vim-indent-guides'
  " Show rich status bar
  Jetpack 'vim-airline/vim-airline'
  Jetpack 'vim-airline/vim-airline-themes'
  "
  Jetpack 'Shougo/deol.nvim'
  " Writing code with AI
  Jetpack 'github/copilot.vim'
  " Share code at realtime
  Jetpack 'jbyuki/instant.nvim'
  " wakatimes plugin
  Jetpack 'wakatime/vim-wakatime'
  " 括弧の入力補完
  Jetpack 'cohama/lexima.vim'
  " Show Discord activity
  Jetpack 'HidemaruOwO/vimcord'
  " Fuzzy Finder
  Jetpack 'junegunn/fzf'
  Jetpack 'junegunn/fzf.vim'
  " Enable Deno
  Jetpack 'vim-denops/denops.vim'
  " 一部の行をコピー
  Jetpack 'Rasukarusan/nvim-select-multi-line'
  Jetpack 'thinca/vim-scouter'
call jetpack#end()

" Comment out backup
" =========== ddu Jetpackins ===========
"  Jetpack  'Shougo/ddu.vim'
"  Jetpack  'Shougo/ddu-ui-ff'
"  Jetpack  'Shougo/ddu-commands.vim'
"  Jetpack  'Shougo/ddu-source-file_rec'
"  Jetpack  'Shougo/ddu-kind-file'
"  Jetpack  'Shougo/ddu-source-file'
"  Jetpack  'shun/ddu-source-rg'
"  Jetpack  'yuki-yano/ddu-filter-fzf'
"  Jetpack  'liquidz/ddu-source-custom-list'
"  Jetpack  'shun/ddu-source-buffer'
"  Jetpack 'Shougo/pum.vim'
" ddc 入力補完
"Jetpack 'Shougo/ddc.vim'
" Install your sources
"Jetpack 'Shougo/ddc-around'
" Install your filters
"Jetpack 'Shougo/ddc-matcher_head'
" Jetpack 'Shougo/ddc-sorter_rank'
" TypeScript
  " LSP packager
 

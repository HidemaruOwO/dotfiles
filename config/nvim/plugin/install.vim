" plugin
call jetpack#begin()
" =========== ddu Plugins ===========  
Jetpack  'Shougo/ddu.vim'
  Jetpack  'Shougo/ddu-ui-ff'
  Jetpack  'Shougo/ddu-commands.vim'
  Jetpack  'Shougo/ddu-source-file_rec'
  Jetpack  'Shougo/ddu-kind-file'
  Jetpack  'Shougo/ddu-source-file'
  Jetpack  'shun/ddu-source-rg'
  Jetpack  'yuki-yano/ddu-filter-fzf'
  Jetpack  'liquidz/ddu-source-custom-list'
  Jetpack  'shun/ddu-source-buffer'
  Jetpack 'Shougo/pum.vim'

" =========== Language Plugins ===========
  " Any
  Jetpack 'prettier/vim-prettier'
  " Go
  Jetpack 'fatih/vim-go'
  " Python 
  Jetpack 'python/mypy'
  " Zig
  Jetpack 'ziglang/zig.vim'
  " Nim
  Jetpack 'baabelfish/nvim-nim'
  " Rust
  Jetpack 'rust-lang/rust.vim'
  Jetpack 'jonathanfilip/vim-lucius'
  " JavaScript
  Jetpack 'windwp/nvim-ts-autotag'
  Jetpack 'windwp/nvim-autopairs'
  Jetpack 'othree/es.next.syntax.vim'
  Jetpack 'othree/yajs.vim'
  Jetpack 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  " TypeScript
  "Jetpack 'leafgarland/typescript-vim'
  " C
  Jetpack 'zchee/deoplete-clang'
  Jetpack 'rhysd/vim-clang-format'
  " Dotnet
  Jetpack 'OmniSharp/omnisharp-vim'
  Jetpack 'neovim/nvim.net'
  " MarkDown
  Jetpack 'previm/previm'
  Jetpack 'mattn/vim-maketable'
  " VimL
  Jetpack 'prabirshrestha/vim-lsp'
  " Fish
  Jetpack 'dag/vim-fish'
" =========== Color Scheme ===========
  Jetpack 'Rigellute/rigel'
  Jetpack 'joshdick/onedark.vim'
" =========== Exterior ===========
  " Change vimdoc language to Japanese
  Jetpack 'vim-jp/vimdoc-ja'
" =========== Tools ===========
  " Preview replace
  Jetpack 'markonm/traces.vim'
  " Show directory tree
  Jetpack 'preservim/nerdtree'
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
  " LSP packager
  Jetpack 'williamboman/nvim-lsp-installer'
  Jetpack 'neovim/nvim-lspconfig'
  " Share code at realtime
  Jetpack 'jbyuki/instant.nvim'
  " 入力補完
  Jetpack 'Shougo/ddc.vim'
  " 入力補完
  Jetpack 'onsails/lspkind-nvim'
  Jetpack 'L3MON4D3/LuaSnip'
  Jetpack 'hrsh7th/cmp-nvim-lsp'
  Jetpack 'hrsh7th/cmp-buffer'
  Jetpack 'hrsh7th/nvim-cmp'
  " wakatimes plugin
  Jetpack 'wakatime/vim-wakatime'
  " Install your sources
  Jetpack 'Shougo/ddc-around'
  " Install your filters
  Jetpack 'Shougo/ddc-matcher_head'
  " Jetpack 'Shougo/ddc-sorter_rank'
  " 括弧の入力補完
  Jetpack 'cohama/lexima.vim'
  " Discordにアクティビティを表示
  Jetpack 'HidemaruOwO/vimcord'
  " IDE化
  Jetpack 'neoclide/coc.nvim', {'branch': 'release'}
  " 曖昧検索
  Jetpack 'junegunn/fzf'
  Jetpack 'junegunn/fzf.vim'
  " Denoを使えるようにする
  Jetpack 'vim-denops/denops.vim'
  " 一部の行をコピー
  Jetpack 'Rasukarusan/nvim-select-multi-line'
call jetpack#end()


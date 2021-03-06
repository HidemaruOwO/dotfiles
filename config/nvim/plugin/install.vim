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
  Jetpack 'p00f/nvim-ts-rainbow'
  Jetpack 'othree/yajs.vim'
  Jetpack 'pangloss/vim-javascript', { 'for': ['javascript'] }
  Jetpack 'mxw/vim-jsx'
  " TypeScript
  Jetpack 'leafgarland/typescript-vim'
  " C
  Jetpack 'zchee/deoplete-clang'
  Jetpack 'rhysd/vim-clang-format'
  " Dotnet
  Jetpack 'OmniSharp/omnisharp-vim'
  Jetpack 'neovim/nvim.net'
  Jetpack 'github/copilot.vim'
  " MarkDown
  Jetpack 'previm/previm'
  Jetpack 'mattn/vim-maketable'
  " VimL
  Jetpack 'prabirshrestha/vim-lsp'
  " Fish
  Jetpack 'dag/vim-fish'
" =========== Color Scheme ===========
  Jetpack 'Rigellute/rigel'
" =========== Exterior ===========
  Jetpack 'vim-jp/vimdoc-ja'
  " 置き換えのプレビュー
  Jetpack 'markonm/traces.vim'
  Jetpack 'preservim/nerdtree'
  Jetpack 'joshdick/onedark.vim'
  Jetpack 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Jetpack 'ryanoasis/vim-devicons'
  Jetpack 'nathanaelkane/vim-indent-guides'
  Jetpack 'vim-airline/vim-airline'
  Jetpack 'vim-airline/vim-airline-themes'

" =========== Tools ===========
  " Bracketを虹色でみやすくする
  Jetpack 'frazrepo/vim-rainbow'
  Jetpack 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Jetpack 'mattn/emmet-vim'
  " 入力補完
  Jetpack 'cohama/lexima.vim'
  " Discordにアクティビティを表示
  Jetpack 'HidemaruOwO/vimcord'
  " IDE化
  Jetpack 'neoclide/coc.nvim', {'branch': 'release'}
  " 曖昧検索
  Jetpack 'junegunn/fzf'
  " Denoを使えるようにする
  Jetpack 'vim-denops/denops.vim'
  " 一部の行をコピー
  Jetpack 'Rasukarusan/nvim-select-multi-line'
call jetpack#end()


inoremap /* /*  */<LEFT><LEFT><LEFT>
nnoremap <Space>v :call sml#mode_on()<CR>

set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard+=unnamed
set hls
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set helplang=ja
syntax enable
filetype plugin indent on

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
  " Nim
  Jetpack 'baabelfish/nvim-nim'
  " Rust
  Jetpack 'rust-lang/rust.vim'
  " JavaScript
  Jetpack 'othree/yajs.vim'
  Jetpack 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
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
  Jetpack 'mattn/vim-lsp-settings' 
  Jetpack 'prabirshrestha/vim-lsp'
  " Go
  Jetpack 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " Fish
  Jetpack 'dag/vim-fish'

  " =========== Exterior ===========
  Jetpack 'vim-jp/vimdoc-ja'
  " 置き換えのプレビュー
  Jetpack 'markonm/traces.vim'
  Jetpack 'preservim/nerdtree'
  Jetpack 'tiagofumo/vim-nerdtree-syntax-highlight'
  Jetpack 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Jetpack 'ryanoasis/vim-devicons'
  Jetpack 'nathanaelkane/vim-indent-guides'
  Jetpack 'vim-airline/vim-airline'
  Jetpack 'vim-airline/vim-airline-themes'
  
" =========== Tools ===========
  Jetpack 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Jetpack 'mattn/emmet-vim'
  " 入力補完
  Jetpack 'cohama/lexima.vim'
  " Discordにアクティビティを表示
  Jetpack 'Stoozy/vimcord'
  " IDE化
  Jetpack 'neoclide/coc.nvim', {'branch': 'release'}
  " 曖昧検索
  Jetpack 'junegunn/fzf', { 'do': { -> fzf#install() } }
  " Denoを使えるようにする
  Jetpack 'vim-denops/denops.vim'
  " 一部の行をコピー
  Jetpack 'Rasukarusan/nvim-select-multi-line'
call jetpack#end()

" coc-pretteir format
command! -nargs=0 Format :call CocAction('format')
" vim-indent-guidesの起動
let g:indent_guides_enable_on_vim_startup = 1
let NERDTreeShowHidden = 1
" airlineの設定
let g:airline_theme = 'tomorrow'
" Powerline系フォントを利用する
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_theme = 'violet'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
" rust format
let g:rustfmt_autosave = 1
" Jetpackの起動の高速化
let g:jetpack#opimization = 1

let g:sml#echo_yank_str = 0

" Previmの起動ブラウザ
if (has("linux"))
  let g:previm_open_cmd = 'xdg-open'
elseif (has("mac"))
  let g:previm_open_cmd = 'open -a Opera'
endif
" Vim Go setting
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_variable_declarations = 1
" Vim sence setting
let g:vimsence_client_id = '439476230543245312'
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
let g:vimsence_custom_icons = {'filetype': 'iconname'}
let g:vimsence_discord_flatpak=1

inoremap /* /*  */<LEFT><LEFT><LEFT>

set number             
set autoindent         
set tabstop=2          
set shiftwidth=2       
set expandtab          
set splitright         
set clipboard=unnamed  
set hls                
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
" vim-plug
call plug#begin()
  Plug 'rust-lang/rust.vim',
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'vimsence/vimsence'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " ddc.vim本体
  Plug 'Shougo/ddc.vim'
  " DenoでVimプラグインを開発するためのプラグイン
  Plug 'vim-denops/denops.vim'
  " ポップアップウィンドウを表示するプラグイン
  Plug 'Shougo/pum.vim'
  " カーソル周辺の既出単語を補完するsource
  Plug 'Shougo/ddc-around'
  " ファイル名を補完するsource
  Plug 'LumaKernel/ddc-file'
  " 入力中の単語を補完の対象にするfilter
  Plug 'Shougo/ddc-matcher_head'
  " 補完候補を適切にソートするfilter
  Plug 'Shougo/ddc-sorter_rank'
  " 補完候補の重複を防ぐためのfilter
  Plug 'Shougo/ddc-converter_remove_overlap'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'cohama/lexima.vim'
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'mattn/emmet-vim'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-clang'
  Plug 'rhysd/vim-clang-format'
call plug#end()
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

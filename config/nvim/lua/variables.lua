-- set global variables
vim.cmd [[
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
]]

vim.cmd [[
  let g:fern#default_hidden=1
   let g:fern#renderer = 'nerdfont'
   let g:airline#extensions#tabline#enabled = 1
   let g:airline#extensions#tabline#buffer_idx_mode = 1
   let g:airline#extensions#whitespace#mixed_indent_algo = 1
   let g:sml#echo_yank_str = 0
   let g:prettier#autoformat_require_pragma = 0
   let g:jetpack#optimization=1
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
   let g:airline_symbols.branch = ''
   let g:airline_symbols.readonly = ''
   let g:airline_symbols.linenr = '☰'
   let g:airline_symbols.maxlinenr = ''
]]

local g = {
  -- seiya.vim
  seiya_auto_enable = 1,
  indent_guides_enable_on_vim_startup = 1,
  NERDTreeShowHidden = 1,
  -- airline
  airline_powerline_fonts = 1,
  -- unicode symbols
  airline_left_sep = "»",
  airline_left_sep = "▶",
  airline_right_sep = "«",
  airline_right_sep = "◀",
  -- powerline symbols
  airline_left_sep = "",
  airline_left_alt_sep = "",
  airline_right_sep = "",
  airline_right_alt_sep = "",
  --
  vimcord_nvim = 1,
  astro_typescript = "enable",
  -- previm-setting
  previm_disable_default_css = 1,
  previm_custom_css_path = "~/dotfiles/templates/previm/github.css",
  instant_username = "HidemaruOwO",
  -- jetpack settings                                                     ,
  jetpack_copy_method = "copy",
}

for k, v in pairs(g) do
  vim.g[k] = v
end

require('barbar').setup()
require('colorizer').setup()
require('nvim-surround').setup()

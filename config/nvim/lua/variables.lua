-- set global variables

vim.cmd([[
  let g:fern#default_hidden=1
  let g:fern#renderer = 'nerdfont'
  let g:sml#echo_yank_str = 0
  let g:prettier#autoformat_require_pragma = 0
  let g:jetpack#optimization=1
  let g:did_install_default_menus = 1
  let g:did_install_syntax_menu   = 1
  let g:did_indent_on             = 1
let g:did_load_filetypes        = 1
"let g:did_load_ftplugin         = 1
let g:loaded_2html_plugin       = 1
let g:loaded_gzip               = 1
let g:loaded_man                = 1
let g:loaded_matchit            = 1
let g:loaded_matchparen         = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_remote_plugins     = 1
let g:loaded_shada_plugin       = 1
let g:loaded_spellfile_plugin   = 1
let g:loaded_tarPlugin          = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_zipPlugin          = 1
let g:skip_loading_mswin        = 1
]])

local g = {
	-- seiya.vim
	seiya_auto_enable = 1,
	indent_guides_enable_on_vim_startup = 1,
	NERDTreeShowHidden = 1,
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

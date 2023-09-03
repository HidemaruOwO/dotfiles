-- set global variables

vim.cmd [[
  let g:fern#default_hidden=1
   let g:fern#renderer = 'nerdfont'
   let g:sml#echo_yank_str = 0
   let g:prettier#autoformat_require_pragma = 0
   let g:jetpack#optimization=1
]]

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

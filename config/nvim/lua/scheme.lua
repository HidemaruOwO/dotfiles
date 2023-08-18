vim.cmd [[
  autocmd ColorScheme * highlight GitGutterAdd ctermfg=green
  autocmd ColorScheme * highlight GitGutterChange ctermfg=blue
  autocmd ColorScheme * highlight GitGutterDelete ctermfg=red
]]

vim.cmd [[
  autocmd ColorScheme * highlight NormalFloat NONE
  autocmd ColorScheme * highlight FloatBorder guifg=gray guibg=#073642
]]

vim.cmd [[
  syntax enable
]]

local theme = "red_sand"

if theme == "red_sand" then
  vim.cmd [[
      colorscheme gruvbox
  ]]
  vim.g.airline_theme = "violet"
elseif theme == "deep_sea" then
  vim.cmd [[
      colorscheme rigel
  ]]
  vim.g.airline_theme = ""
end

vim.cmd([[
  autocmd ColorScheme * highlight GitGutterAdd ctermfg=green
  autocmd ColorScheme * highlight GitGutterChange ctermfg=blue
  autocmd ColorScheme * highlight GitGutterDelete ctermfg=red
]])

vim.cmd([[
  autocmd ColorScheme * highlight NormalFloat NONE
  autocmd ColorScheme * highlight FloatBorder guifg=gray guibg=NONE
]])

vim.cmd([[
  syntax enable
]])

local theme = "deep_snow"

if theme == "red_sand" then
	vim.cmd([[
      colorscheme gruvbox
  ]])
	vim.g.airline_theme = "violet"
elseif theme == "deep_sea" then
	vim.cmd([[
      colorscheme rigel
  ]])
elseif theme == "deep_snow" then
	vim.cmd([[
      colorscheme hybrid
      "highlight LineNr term=bold cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=Grey guibg=NONE
  ]])
	vim.g.airline_theme = "deus"
end

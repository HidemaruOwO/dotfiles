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

local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  shell = "fish",
  number = true,
  autoindent = true,
  tabstop = 2,
  shiftwidth = 3,
  laststatus = 3,
  helplang = "ja",
  virtualedit = "onemore",
  expandtab = true,
  splitright = true,
  hls = true,
  smartindent = true,
  showmatch = true,
  laststatus = 2,
}

vim.cmd [[
  set mouse-=nvi
  set wildmode=list:longest
]]

for k, v in pairs(options) do
  vim.opt[k] = v
end
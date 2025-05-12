vim.cmd("packadd vim-jetpack")

require("jetpack.packer").add {
  {"tani/vim-jetpack"}, -- bootstrap

  -- ======= Core =======
  -- ======= LSP =======
  -- ======= Denops =======
  -- ======= Advanced =======
}

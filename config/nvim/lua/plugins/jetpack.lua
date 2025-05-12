vim.cmd("packadd vim-jetpack")

require("jetpack.packer").add {
  {"tani/vim-jetpack"}, -- bootstrap

  -- ======= Core =======
  -- ======= LSP =======
  -- ======= Denops =======
  -- ======= Advanced =======
  {"HidemaruOwO/mdxsnap.nvim", cmd = "PasteImage", ft = {"markdown", "mdx"}, config = function() require("plugins.mdxsnap") end },
}

local prettier = require("prettier")

prettier.setup({
  bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },
})

vim.cmd [[
    autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.yaml,*.html Prettier
]]

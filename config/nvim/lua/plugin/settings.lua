vim.cmd [[
function! DeolFloat() abort
    :Deol -split=floating -winheight=35 -winwidth=120 -winrow=11.5 -wincol=45
endfunction
]]

-- set global variables
vim.cmd [[
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
]]

vim.cmd [[
   let g:fern#renderer = 'nerdfont'
   let g:airline#extensions#tabline#enabled = 1
   let g:airline#extensions#tabline#buffer_idx_mode = 1
   let g:airline#extensions#whitespace#mixed_indent_algo = 1
   let g:sml#echo_yank_str = 0
   let g:prettier#autoformat_require_pragma = 0
   let g:jetpack#optimization=2
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

-- add runtimepath
vim.opt.runtimepath:append("~/dotfiles/templates/treesitter")

-- vim-treesitter-config
require 'nvim-treesitter.configs'.setup {
   -- A list of parser names, or "all"
   sync_install = false,

   auto_install = true,


   parser_install_dir = "~/dotfiles/templates/treesitter",
   highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
   },
   rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
   },
   autotag = {
      enable = true,
   },
}
-- nvim-autorepair
local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
   disable_filetype = { "TelescopePrompt", "vim" },
})
-- Setup nvim-cmp.
local cmp = require 'cmp'

local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

cmp.setup({
   snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
   },
   mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs( -4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true
      }),
      ['<TAB>'] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true
      }),

   }),
   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'buffer' },
   }),
   formatting = {
      format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
   }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
   sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
   }, {
      { name = 'buffer' },
   })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = {
      { name = 'buffer' }
   }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
   mapping = cmp.mapping.preset.cmdline(),
   sources = cmp.config.sources({
      { name = 'path' }
   }, {
      { name = 'cmdline' }
   })
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

--local on_attach = function(client, bufnr)

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
   function(server_name) -- default handler (optional)
      if server_name == "denols" then
         lspconfig["denols"].setup {
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "deps.ts", "import_map.json"),
            capabilities = capabilities,
            lint = true,
            unstable = true,
            suggest = {
               imports = {
                  hosts = {
                     ["https://deno.land"] = true,
                     ["https://cdn.nest.land"] = true,
                     ["https://crux.land"] = true,
                  },
               },
            },
         }
         return
      elseif server_name == "tsserver" then
         lspconfig["tsserver"].setup {
            root_dir = lspconfig.util.root_pattern("package.json"),
            capabilities = capabilities,
         }
         return
      else
         lspconfig[server_name].setup {
            capabilities = capabilities,
         }
      end
   end
}
local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
   server_filetype_map = {
      typescript = 'typescript'
   }
}

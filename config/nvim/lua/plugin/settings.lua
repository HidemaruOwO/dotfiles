vim.cmd [[ function! RoundToInteger(number)
    let integer_part = float2nr(a:number)
    let decimal_part = a:number - integer_part
    let rounded_decimal = round(decimal_part)

    if rounded_decimal == 1
        return integer_part + 1
    else
        return integer_part
    endif
endfunction


function! DeolFloat() abort
  let my_winwidth = winwidth('0') / 2
  let my_winheight = RoundToInteger( winheight('0') / 3 )
  let cmd = 'Deol -split=floating -winheight=' . my_winheight . ' -winwidth=' . my_winwidth . ' '
  execute cmd
endfunction
]]

-- set global variables
vim.cmd [[
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
]]

vim.cmd [[
  let g:fern#default_hidden=1
   let g:fern#renderer = 'nerdfont'
   let g:airline#extensions#tabline#enabled = 1
   let g:airline#extensions#tabline#buffer_idx_mode = 1
   let g:airline#extensions#whitespace#mixed_indent_algo = 1
   let g:sml#echo_yank_str = 0
   let g:prettier#autoformat_require_pragma = 0
   let g:jetpack#optimization=1
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
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
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
  },
  window = {
    completion = cmp.config.window.bordered({
      border = 'single'
    }),
    documentation = cmp.config.window.bordered({
      border = 'single'
    })
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
    elseif server_name == "lua_ls" then
      lspconfig["lua_ls"].setup {
        settings = {
          Lua = {
            completion = {
              lcallSinppet = "Replace",
            },
          },
        },
      }
    else
      lspconfig[server_name].setup {
        capabilities = capabilities,
      }
    end
  end
}

require("lspsaga").setup({
  border_style = "single",
  symbol_in_winbar = {
    enable = true,
  },
  code_action_lightbulb = {
    enable = true,
  },
  show_outline = {
    win_width = 50,
    auto_preview = false,
  },
})

require('git-conflict').setup()

local function isNodejs()
  local packagejson = "package.json"

  if vim.fn.findfile(packagejson, "./") == packagejson then
    return true
  else
    return false
  end
end

require("runit").setup({
  js = function(file)
    if isNodejs() then
      return "node" .. file
    else
      return "deno run -A " .. file
    end
  end,
  ts = function(file)
    if isNodejs() then
      return "ts-node" .. file
    else
      return "deno run -A " .. file
    end
  end,
  mjs = function(file)
    return "node" .. file
  end,
  py = function(file)
    return "python3" .. file
  end,
  go = function(file)
    return "go run" .. file
  end,
})

local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<C-f>", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr, async = async })
        end,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})

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
  call ddu#custom#patch_local('filer', {
\   'ui': 'filer',
\   'sources': [
\     {
\       'name': 'file',
\       'params': {},
\     },
\   ],
\   'sourceOptions': {
\     '_': {
\       'columns': ['icon_filename'],
\     },
\   },
\   'kindOptions': {
\     'file': {
\       'defaultAction': 'open',
\     },
\   },
\   'uiParams': {
\     'filer': {
\        'split': 'floating'
\     }
\   },
\ })
]]

require('telescope').setup({
  defaults = {
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
  },
})

require('dressing').setup({
  input = {
    border = 'single',
  },
  builtin = {
    border = 'single',
  },
})

local noice = require("noice")

local function myMiniView(pattern, kind)
  kind = kind or ""
  return {
    view = "mini",
    filter = {
      event = "msg_show",
      kind = kind,
      find = pattern,
    },
  }
end

noice.setup({
  messages = {
    view_search = "mini",
  },
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
    {
      filter = {
        event = "notify",
        warning = true,
        find = "failed to run generator.*is not executable",
      },
      opts = { skip = true },
    },
    myMiniView("Already at .* change"),
    myMiniView("written"),
    myMiniView("yanked"),
    myMiniView("more lines?"),
    myMiniView("fewer lines?"),
    myMiniView("fewer lines?", "lua_error"),
    myMiniView("change; before"),
    myMiniView("change; after"),
    myMiniView("line less"),
    myMiniView("lines indented"),
    myMiniView("No lines in buffer"),
    myMiniView("search hit .*, continuing at", "wmsg"),
    myMiniView("E486: Pattern not found", "emsg"),
  },
})

require('barbar').setup()
require('colorizer').setup()
require('nvim-surround').setup()

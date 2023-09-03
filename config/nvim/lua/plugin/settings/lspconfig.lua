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
      return
    elseif server_name == "zls" then
      lspconfig["zls"].setup {
        root_dir = lspconfig.util.root_pattern("build.zig"),
        cmd = { "/usr/bin/zls" },
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

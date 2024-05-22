local lsp = require"lspconfig"

-- lsp.bashls.setup{
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp.cssls.setup {
  capabilities = capabilities,
}

-- lsp.html.setup {
  -- capabilities = capabilities,
-- }

-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, "lua/?.lua")
-- table.insert(runtime_path, "lua/?/init.lua")
-- lsp.sumneko_lua.setup {
-- }

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

lsp.denols.setup {
  cmd = {
    "deno",
    "lsp",
  },
	filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
	},
  settings = {
    deno = {
      enable = true,
      suggest = {
        imports = {
          hosts = {
            ["https://deno.land"] = true,
            ["https://cdn.nest.land"] = true,
            ["https://crux.land"] = true,
            ["https://esm.sh"] = true,
          }
        }
      }
    }
  }
}

lsp.dockerls.setup{
}

lsp.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    },
  },
}

-- lsp.tsserver.setup {
--   root_dir = lsp.util.root_pattern("package.json"),
-- }

-- lsp.svelte.setup {
--
-- }

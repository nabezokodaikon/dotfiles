local lsp = require"lspconfig"

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lsp.bashls.setup{
-- }

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

-- lsp.denols.setup{
  -- root_dir = lsp.util.root_pattern("deno.json", "deno.jsonc")
-- }

lsp.dockerls.setup{
}

lsp.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      imports = {
          granularity = {
              group = "module",
          },
          prefix = "self",
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

lsp.tsserver.setup {
  root_dir = lsp.util.root_pattern("package.json"),
}

lsp.svelte.setup {

}

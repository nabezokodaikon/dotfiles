local lsp = require"lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp.cssls.setup {
  capabilities = capabilities,
}

-- lsp.denols.setup{
-- }

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

lsp.tsserver.setup {
    root_dir = lsp.util.root_pattern("package.json"),
}

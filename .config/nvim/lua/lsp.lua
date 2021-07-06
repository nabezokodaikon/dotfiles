--------------------------------
-- LSP configurations
--------------------------------
local lsp = require"lspconfig"

lsp.cssls.setup {
}

lsp.denols.setup{
    root_dir = lsp.util.root_pattern("deps.ts"),
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

lsp.tsserver.setup {
    root_dir = lsp.util.root_pattern("package.json")
}

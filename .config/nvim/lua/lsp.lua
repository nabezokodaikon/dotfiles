--------------------------------
-- LSP configurations
--------------------------------
local lsp = require'lspconfig'
-- local completion = require'completion'
local util = require'lspconfig/util'


-- local on_attach = function(client)
    -- completion.on_attach(client)
-- end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

local snippetSupport = vim.lsp.protocol.make_client_capabilities()
snippetSupport.textDocument.completion.completionItem.snippetSupport = true


lsp.cssls.setup {
    capabilities = snippetSupport,
}

lsp.denols.setup{
}

-- lsp.tsserver.setup {
    -- -- on_attach = on_attach,
-- }

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

-- lsp.metals.setup {}

-- lsp.pyls_ms.setup {}

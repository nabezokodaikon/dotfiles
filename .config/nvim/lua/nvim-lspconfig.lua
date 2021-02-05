--------------------------------
-- LSP configurations
--------------------------------
local lsp = require'lspconfig'
local completion = require'completion'
local util = require'lspconfig/util'

local capabilities = {
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = false
            },
        },
    },
}

local on_attach = function(client)
    completion.on_attach(client)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)


lsp.tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- lsp.metals.setup {}

-- lsp.pyls_ms.setup {}

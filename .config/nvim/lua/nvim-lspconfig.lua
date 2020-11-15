--------------------------------
-- LSP configurations
--------------------------------
local lsp = require'lspconfig'
local diagnostic = require'diagnostic'

local capabilities = {
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = false
            },
        },
    },
};

local on_attach = function(client)
    diagnostic.on_attach(client)
end


lsp.metals.setup {}


lsp.pyls_ms.setup {}


lsp.rust_analyzer.setup {
    -- settings = {
        -- ["rust-analyzer"] = {
            -- completion = {
                -- addCallArgumentSnippets = false,
                -- addCallParenthesis = false,
                -- postfix = {
                    -- enable = false,
                -- },
            -- },
        -- },
    -- },
    capabilities = capabilities,
    on_attach = on_attach,
}


lsp.tsserver.setup {}

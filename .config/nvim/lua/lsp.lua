--------------------------------
-- LSP configurations
--------------------------------
local lsp = require'nvim_lsp'
-- local completion = require "completion"
-- local diagnostic = require "diagnostic"

local capabilities = {
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = false
            }
        }
    }
};

function on_attach()
    -- completion.on_attach()
    -- diagnostic.on_attach()
end


lsp.metals.setup{}


lsp.pyls_ms.setup{}


lsp.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            completion = {
                addCallArgumentSnippets = false,
                addCallParenthesis = false,
                postfix = {
                    enable = false,
                }
            }
        }
    },
    capabilities = capabilities,
    on_attach = on_attach,
}


lsp.tsserver.setup{}

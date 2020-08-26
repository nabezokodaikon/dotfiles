--------------------------------
-- LSP configurations
--------------------------------
local lsp = require'nvim_lsp'
-- local completion = require "completion"
-- local diagnostic = require "diagnostic"

function on_attach()
    -- completion.on_attach()
    -- diagnostic.on_attach()
end

local capabilities = {
    textDocument = {
        completion = {
            completionItem = {
                snippetSupport = false
            }
        }
    }
};


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
}


lsp.tsserver.setup{}

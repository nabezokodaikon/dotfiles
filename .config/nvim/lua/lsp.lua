--------------------------------
-- LSP configurations
--------------------------------
local lsp = require "nvim_lsp"
-- local completion = require "completion"
-- local diagnostic = require "diagnostic"

function on_attach()
    -- diagnostic.on_attach()
    -- completion.on_attach()
end

lsp.metals.setup{}


lsp.rust_analyzer.setup{ on_attach = on_attach }


lsp.pyls_ms.setup{}


lsp.tsserver.setup{}

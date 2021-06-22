--------------------------------
-- LSP configurations
--------------------------------
local g = vim.g
local o = vim.o

-- LSP setting module.
local lsp = require'lspconfig'
local util = require'lspconfig/util'
local completion = require'completion'
local compe = require'compe'


-- Completion setting
--------------------------------
o.completeopt="menuone,noinsert,noselect"

g.completion_chain_complete_list =
    {
        default = {
            default = {
                {complete_items = {'lsp', 'buffer'}},
                {mode = '<C-p>'},
                {mode = '<C-n>'}
            },
            comment = {},
            string = {{complete_items = {'path'}, triggered_only = {'/'}}}
        },
    }

compe.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        vsnip = true;
        ultisnips = true;
    };
}


-- Virtual text setting
--------------------------------
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)


-- Each LSP setting.
--------------------------------
-- For CSS LSP.
local snippetSupport = vim.lsp.protocol.make_client_capabilities()
snippetSupport.textDocument.completion.completionItem.snippetSupport = true

-- local on_attach = function(client)
    -- completion.on_attach(client)
-- end

lsp.cssls.setup {
    capabilities = snippetSupport,
    on_attach = completion.on_attach,
}

lsp.denols.setup{
    on_attach = completion.on_attach,
}

-- lsp.tsserver.setup {
    -- on_attach = completion.on_attach,
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
    on_attach = completion.on_attach,
}

-- lsp.metals.setup {}

-- lsp.pyls_ms.setup {}

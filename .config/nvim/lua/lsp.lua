--------------------------------
-- LSP settings
--------------------------------
local lsp = require"lspconfig"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp.cssls.setup {
  capabilities = capabilities,
}

local on_attach = function(client, bufnr)
  local api = vim.api
  local opts = { noremap = true, silent = true }
  api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}
lsp.denols.setup{
    on_attach = on_attach,
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
    on_attach = on_attach,
}

lsp.tsserver.setup {
    root_dir = lsp.util.root_pattern("package.json"),
    on_attach = on_attach,
}

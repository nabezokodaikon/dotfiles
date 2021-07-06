--------------------------------
-- Virtual text configurations
--------------------------------
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

vim.api.nvim_exec([[
    augroup custom_theme_highlights
        autocmd!
        autocmd ColorScheme * hi LspDiagnosticsDefaultError guifg=#EB4917 gui=BOLD
        autocmd ColorScheme * hi LspDiagnosticsDefaultWarning guifg=#EBA217 gui=BOLD
        autocmd ColorScheme * hi LspDiagnosticsDefaultInformation guifg=#17D6EB gui=BOLD
        autocmd ColorScheme * hi LspDiagnosticsDefaultHint guifg=#17EB7A gui=BOLD
    augroup END
]], false)

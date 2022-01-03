vim.g.symbols_outline = {
    highlight_hovered_item = false,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    keymaps = {
        close = "q",
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-k>",
        rename_symbol = "r",
        code_actions = "<Nop>",
    },
    lsp_blacklist = {},
}

-- vim.api.nvim_set_keymap('n', '<Leader>o', '<C-u>SymbolsOutline', { noremap = true, silent = true })

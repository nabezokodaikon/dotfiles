"--------------------------------
" LSP configurations
"--------------------------------
luafile ~/.config/nvim/lua/nvim-lspconfig.lua

function! SetLSPHighlights()
    highlight LspDiagnosticsDefaultError guifg=#EB4917 guibg=NONE gui=BOLD
    highlight LspDiagnosticsDefaultWarning guifg=#EBA217 guibg=NONE gui=BOLD
    highlight LspDiagnosticsDefaultInformation guifg=#17D6EB guibg=NONE gui=BOLD
    highlight LspDiagnosticsDefaultHint guifg=#17EB7A guibg=NONE gui=BOLD
endfunction

autocmd ColorScheme * call SetLSPHighlights()

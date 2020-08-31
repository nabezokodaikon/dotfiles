"--------------------------------
" LSP configurations
"--------------------------------
luafile ~/.config/nvim/lua/lsp.lua

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_insert_delay = 1

function! SetLSPHighlights()
  hi LspDiagnosticsError guifg=#EB4917 guibg=NONE gui=BOLD
  hi LspDiagnosticsWarning guifg=#EBA217 guibg=NONE gui=BOLD
  hi LspDiagnosticsInformation guifg=#17D6EB guibg=NONE gui=BOLD
  hi LspDiagnosticsHint guifg=#17EB7A guibg=NONE gui=BOLD
endfunction

autocmd ColorScheme * call SetLSPHighlights()

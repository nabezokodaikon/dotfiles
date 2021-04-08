"--------------------------------
" LSP configurations
"--------------------------------
luafile ~/.config/nvim/lua/lsp.lua

" set completeopt=menuone,noinsert,noselect
" set shortmess+=c
" let g:completion_chain_complete_list = [
    " \{'complete_items': ['lsp', 'path']},
    " \{'mode': '<c-p>'},
    " \{'mode': '<c-n>'}
" \]
" let g:completion_items_duplicate = { 'lsp': 0 }

function! SetLSPHighlights()
    highlight LspDiagnosticsDefaultError guifg=#EB4917 guibg=NONE gui=BOLD
    highlight LspDiagnosticsDefaultWarning guifg=#EBA217 guibg=NONE gui=BOLD
    highlight LspDiagnosticsDefaultInformation guifg=#17D6EB guibg=NONE gui=BOLD
    highlight LspDiagnosticsDefaultHint guifg=#17EB7A guibg=NONE gui=BOLD

    " 下線 undercurl は波線を意味するが、Macでは直線になってしまった。
    " highlight LspDiagnosticsUnderlineError guifg=#EB4917 gui=undercurl
    " highlight LspDiagnosticsUnderlineWarning guifg=#EBA217 gui=undercurl
    " highlight LspDiagnosticsUnderlineInformation guifg=#17D6EB, gui=undercurl
    " highlight LspDiagnosticsUnderlineHint guifg=#17EB7A gui=undercurl

endfunction

autocmd ColorScheme * call SetLSPHighlights()

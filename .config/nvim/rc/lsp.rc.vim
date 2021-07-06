"--------------------------------
" LSP settings
"--------------------------------
luafile ~/.config/nvim/lua/lsp.lua


set completeopt=menuone,noinsert,noselect


" Virtual text color setting
"--------------------------------
augroup custom_theme_highlights
    autocmd!
    autocmd ColorScheme * hi LspDiagnosticsDefaultError guifg=#EB4917 gui=BOLD
    autocmd ColorScheme * hi LspDiagnosticsDefaultWarning guifg=#EBA217 gui=BOLD
    autocmd ColorScheme * hi LspDiagnosticsDefaultInformation guifg=#17D6EB gui=BOLD
    autocmd ColorScheme * hi LspDiagnosticsDefaultHint guifg=#17EB7A gui=BOLD
augroup END


" Enable/Disable Completion setting
"--------------------------------
function! s:enable_completion()
    lua require'lsp'.enable_completion()
endfunction

function! s:disable_completion()
    lua require'lsp'.disable_completion()
endfunction

" denite-filter commit message completion settings
autocmd WinEnter,BufEnter *
    \ if &ft != "denite-filter"
    \| call s:enable_completion() | else
    \| call s:disable_completion() | endif

" Git commit message completion settings
" autocmd WinEnter,BufEnter *
    " \ if expand("%") != "COMMIT_EDITMSG"
    " \| call s:enable_completion() | else
    " \| call s:disable_completion() | endif

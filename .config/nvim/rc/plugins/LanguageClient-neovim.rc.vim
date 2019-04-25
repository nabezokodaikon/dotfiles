"--------------------------------
" LanguageClient-neovim
"--------------------------------
set hidden
set completeopt=menu
set signcolumn=yes

let g:LanguageClient_useVirtualText = 0

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ }

function! s:restartLanguageClient()
    LanguageClientStop
    sleep 300m
    LanguageClientStart
endfunction

augroup languageClient-neovim
    autocmd!
    autocmd BufWritePre *.rs call s:restartLanguageClient()
augroup END

command! LanguageClientReStart call s:restartLanguageClient()

LanguageClientReStart

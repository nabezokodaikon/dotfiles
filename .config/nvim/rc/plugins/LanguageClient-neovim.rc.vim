"--------------------------------	
" LanguageClient-neovim	
"--------------------------------	
set hidden	
set completeopt=menu	
set signcolumn=yes	

let g:LanguageClient_useVirtualText = 0	
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1

if &ft=="haxe"
    let g:LanguageClient_settingsPath = '~/dotfiles/.config/nvim/haxelsp/settings.json'
endif

let g:LanguageClient_serverCommands = {	
    \ 'haxe': ['node', '~/dotfiles/.config/nvim/haxelsp/server.js'],
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],	
    \ 'scala': ['metals-vim']
    \ }	

" let g:LanguageClient_rootMarkers = {
    " \ 'haxe': ['build.hxml']
    " \ }

function! s:restartLanguageClient()	
    LanguageClientStop	
    sleep 300m	
    LanguageClientStart	
endfunction	

" augroup languageClient-neovim	
    " autocmd!	
    " autocmd BufWritePre *.rs call s:restartLanguageClient()	
" augroup END	

command! LanguageClientReStart call s:restartLanguageClient()	

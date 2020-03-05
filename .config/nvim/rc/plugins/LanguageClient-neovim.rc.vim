"--------------------------------	
" LanguageClient-neovim	
"--------------------------------	
set hidden	
set completeopt=menu	
set signcolumn=yes	

let g:LanguageClient_useVirtualText = 'No'
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1

if &ft=="haxe"
    let g:LanguageClient_settingsPath = '~/dotfiles/.config/nvim/haxelsp/settings.json'
    let g:LanguageClient_rootMarkers = {
        \ 'haxe': ['build.hxml']
        \ }
endif

let g:LanguageClient_serverCommands = {	
    \ 'haxe': ['node', '~/dotfiles/.config/nvim/haxelsp/server.js'],
    \ 'rust': ['~/.cargo/bin/rust-analyzer'],	
    \ 'scala': ['metals-vim']
    \ }	

function! s:restartLanguageClient()		
    LanguageClientStop		
    sleep 500m		
    LanguageClientStart		
endfunction		

command! LanguageClientReStart call s:restartLanguageClient()	

" let $RUST_BACKTRACE = 1
" let g:LanguageClient_loggingLevel = 'INFO'
" let g:LanguageClient_virtualTextPrefix = ''
" let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
" let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

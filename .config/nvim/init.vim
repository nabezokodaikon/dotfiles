"--------------------------------
" Initial configurations
"--------------------------------
filetype off
filetype plugin indent off


let s:is_windows = has('win32') || has('win64')
let s:is_mac = !s:is_windows 
    \ && !has('win32unix')
    \ && (has('mac') || has('macunix') || has('gui_macvim') || (!executable('xdg-open') && system('uname') =~? '^darwin'))
let s:is_linux = !s:is_windows && !s:is_mac && has('unix')

function! IsWindows() abort
    return s:is_windows
endfunction

function! IsMac() abort
    return s:is_mac
endfunction

function! IsLinux() abort
    return s:is_linux
endfunction


" Set disable providers
let g:loaded_node_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0
let g:loaded_ruby_provider = 0


" Basic settings
luafile ~/.config/nvim/lua/basic.lua

" Key mappings
luafile ~/.config/nvim/lua/mappings.lua

" File type settings
luafile ~/.config/nvim/lua/filetypes.lua

" Tab settings
source ~/.config/nvim/rc/tab.rc.vim

" プラグイン管理設定
source ~/.config/nvim/rc/dein/dein.rc.vim


filetype plugin indent on

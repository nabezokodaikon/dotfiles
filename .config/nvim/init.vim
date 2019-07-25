"--------------------------------
" Initial configurations
"--------------------------------
if &compatible
    set nocompatible
endif


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
let g:loaded_ruby_provider = 1
let g:loaded_python_provider = 1

" Set path on providers
if IsWindows()
    let g:python3_host_prog = 'C:\Users\nabezokodaikon\AppData\Local\Programs\Python\Python37-32\python.exe'
    " let g:node_host_prog = '/usr/local/bin/neovim-node-host'
elseif IsMac()
    let g:python3_host_prog = '/usr/local/bin/python3'
    let g:node_host_prog = '/usr/local/bin/neovim-node-host'
endif


" プラグイン管理設定
source ~/.config/nvim/rc/dein.rc.vim

" 基本設定
source ~/.config/nvim/rc/basic.rc.vim

" Key mapping configurations
source ~/.config/nvim/rc/mappings.rc.vim

" File type configurations
source ~/.config/nvim/rc/filetypes.rc.vim

" Ctags command
source ~/.config/nvim/rc/ctags.rc.vim

" Hacks
source ~/.config/nvim/rc/hacks.rc.vim

" Plugins configurations
source ~/.config/nvim/rc/plugins.rc.vim


filetype plugin indent on

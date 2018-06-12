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
let g:loaded_node_provider = 1

" Set path on providers
if IsMac()
    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
endif


" プラグイン管理設定
source ~/.config/nvim/rc/dein.rc.vim

" 基本設定
source ~/.config/nvim/rc/basic.rc.vim

" Key mapping configurations
source ~/.config/nvim/rc/mappings.rc.vim

" Translation process
source ~/.config/nvim/rc/translate.rc.vim

" Ctags command
source ~/.config/nvim/rc/ctags.rc.vim

" Hacks
source ~/.config/nvim/rc/hacks.rc.vim

" Plugins configurations
source ~/.config/nvim/rc/plugins/jellybeans.rc.vim
source ~/.config/nvim/rc/plugins/nerdcommenter.rc.vim
source ~/.config/nvim/rc/plugins/vim-easymotion.rc.vim
source ~/.config/nvim/rc/plugins/vim-fugitive.rc.vim
source ~/.config/nvim/rc/plugins/vim-submode.rc.vim


filetype plugin indent on

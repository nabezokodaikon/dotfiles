filetype off
filetype plugin indent off


if &compatible
    set nocompatible
endif


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


" プラグイン管理設定
source ~/.config/nvim/rc/dein.rc.vim

" 基本設定
source ~/.config/nvim/rc/basic.rc.vim

" プラグイン設定
source ~/.config/nvim/rc/plugins.rc.vim

" tags 設定
source ~/.config/nvim/rc/tags.rc.vim

" tab 設定
source ~/.config/nvim/rc/tab.rc.vim

" split 設定
source ~/.config/nvim/rc/split.rc.vim

" Translation process
source ~/.config/nvim/rc/translate.rc.vim

" Hacks
source ~/.config/nvim/rc/hacks.rc.vim


filetype plugin indent on

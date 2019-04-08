"--------------------------------
" Vim設定
"--------------------------------
filetype off
filetype plugin indent off


"--------------------------------
" Key mapping configurations
"--------------------------------

" Unmappings
"--------------------------------
" Disable the Ex mode.
nnoremap Q <Nop>
nnoremap gQ <Nop>


" General
"--------------------------------
" Switch to the normal mode.
inoremap jj <ESC>


"--------------------------------
" 基本設定
"--------------------------------
source ~/.config/nvim/rc/basic.rc.vim


filetype plugin indent on

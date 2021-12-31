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

" Jump to the line head and tail
noremap <C-h> 0
noremap <C-l> $

" Disable completion
inoremap <C-n> <Nop>
inoremap <C-p> <Nop>

" Change of the leader key. 
nnoremap <Space> <Nop>
let mapleader = "\<Space>"


" File reload
"--------------------------------
nnoremap <silent> <Leader>\ :e!<CR>


" split
"--------------------------------
" Unmappings
nnoremap <C-w>s <Nop>
nnoremap <C-w>S <Nop>
nnoremap <C-w><C-s> <Nop>
nnoremap <C-w><C-S> <Nop>
nnoremap <C-w>v <Nop>
nnoremap <C-w>V <Nop>
nnoremap <C-w><C-v> <Nop>
nnoremap <C-w><C-V> <Nop>
nnoremap <C-w>n <Nop>
nnoremap <C-w>N <Nop>
nnoremap <C-w><C-n> <Nop>
nnoremap <C-w><C-N> <Nop>

" Current split
nnoremap <silent> <C-w>s :vsplit<CR>
nnoremap <silent> <C-w>S :split<CR>

" New split
nnoremap <silent> <C-w>n :vnew<CR>
nnoremap <silent> <C-w>N :new<CR>


" tab
"--------------------------------
" Unmappings
nnoremap gn <Nop>
nnoremap gc <Nop>

nnoremap gn :tabnew<CR>
nnoremap gc :tabclose<CR>

"--------------------------------
" Key mapping configurations
"--------------------------------
" Switch To the command mode.
inoremap <silent> jj <esc>

" <leader> を <space> に変更
let mapleader = "\<space>"


" split
"--------------------------------
" Unmapping
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
" tmux のタブ(ウィンドウ操作に合わせる)
" 新しいタブを開く
nnoremap gn <Nop>
nnoremap gn :tabnew<CR>

" 現在のタブを閉じる
nnoremap gc <Nop>
nnoremap gc :tabclose<CR>


" tags 
"--------------------------------
" <C-t> は tmux と被るため無効化
nnoremap <C-t> <Nop>
" タグ操作のプレフィックスを t とする
nnoremap t <Nop>
" 飛ぶ
nnoremap tt g<C-]>
" 進む
nnoremap tj :<C-u>tag<CR>
" 戻る
nnoremap tk :<C-u>pop<CR>
" 履歴一覧
nnoremap tl :<C-u>tags<CR>

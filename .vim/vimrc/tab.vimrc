"--------------------------------
" tab 設定
"--------------------------------
" tmux のタブ(ウィンドウ操作に合わせる)
" 新しいタブを開く
noremap gn :tabnew<CR>
" 現在のタブを閉じる
noremap gc :tabclose<CR>
" 次のタブへ移動
noremap gt <Nop>
noremap gn :tabnext<CR>
" 前のタブへ移動
noremap gT <Nop>
noremap gp :tabNext<CR>

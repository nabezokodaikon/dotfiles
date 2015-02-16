"--------------------------------
" tab 設定
"--------------------------------
" tmux のタブ(ウィンドウ操作に合わせる)
" 新しいタブを開く
nnoremap gc <Nop>
nnoremap gc :tabnew<CR>

" 現在のタブを閉じる
nnoremap gd <Nop>
nnoremap gd :tabclose<CR>

" 次のタブへ移動
nnoremap gn <Nop>
nnoremap gn :tabnext<CR>

" 前のタブへ移動
nnoremap gp <Nop>
nnoremap gp :tabNext<CR>

" vim-submode
" 次のタブへ移動する操作を押しっぱなしでできるようにする。 
call submode#enter_with('changetab', 'n', '', 'gn', 'gt')
call submode#map('changetab', 'n', '', 'n', 'gt')

" 前のタブへ移動する操作を押しっぱなしでできるようにする。
call submode#enter_with('changetab', 'n', '', 'gp', 'gT')
call submode#map('changetab', 'n', '', 'p', 'gT')

" unite.vim
nnoremap <silent> [unite]<space> :<C-u>Unite tab<CR>

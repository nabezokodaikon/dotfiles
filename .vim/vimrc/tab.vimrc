"--------------------------------
" tab 設定
"--------------------------------
" tmux のタブ(ウィンドウ操作に合わせる)
" 新しいタブを開く
noremap gc :tabnew<CR>
" 現在のタブを閉じる
noremap gd :tabclose<CR>

" vim-submode
" 次のタブへ移動 
call submode#enter_with('changetab', 'n', '', 'gn', 'gt')
call submode#map('changetab', 'n', '', 'n', 'gt')
" 前のタブへ移動
call submode#enter_with('changetab', 'n', '', 'gp', 'gT')
call submode#map('changetab', 'n', '', 'p', 'gT')

" unite.vim
nnoremap <silent> [unite]<space> :<C-u>Unite tab<CR>

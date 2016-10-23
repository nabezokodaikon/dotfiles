"--------------------------------
" tags 設定 
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

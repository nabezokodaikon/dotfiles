"--------------------------------
" vim-easymotion configurations
"--------------------------------
" デフォルトのキーマッピングを無効化する。
let g:EasyMotion_do_mapping = 0

" 大文字、小文字を区別しない。
let g:EasyMotion_smartcase = 1

" 2文字のキーワード検索のみを有効化する。
nmap <Leader>s <Plug>(easymotion-s2)

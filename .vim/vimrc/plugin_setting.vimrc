"--------------------------------
" プラグイン設定 
"--------------------------------

" vim-gista
"--------------------------------
let g:gista#github_user = 'nabezokodaikon'


" nerdcommenter
"--------------------------------
" コメントの間にスペースを開ける
let NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle


" tagbar
"--------------------------------
" タグバーをトグル
nnoremap <silent> <F8> :TagbarToggle<Cr>
" タグバー表示時に、タグバーにフォーカスする
let g:tagbar_autofocus = 1
" タグバーで項目選択後、タグバーを自動で閉じる
let g:tagbar_autoclose = 1


" Previm.vim
"--------------------------------
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END


" dwm.vim
"--------------------------------
nmap <C-[> <Plug>DWMRotateCounterclockwise


" seiya.vim
"--------------------------------
" 背景の透過を有効化する。
let g:seiya_auto_enable = 1

" vim-easymotion
"--------------------------------
" デフォルトのキーマッピングを無効化する。
let g:EasyMotion_do_mapping = 0
" 大文字、小文字を区別しない。
let g:EasyMotion_smartcase = 1
" 2文字のキーワード検索のみを有効化する。
nmap <Leader>s <Plug>(easymotion-s2)

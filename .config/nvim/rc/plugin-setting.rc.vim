"--------------------------------
" プラグイン設定 
"--------------------------------

" vim-fugitive
"--------------------------------
" ステータスラインの書式にgitの情報を表示する。
set statusline=%F\ [%Y][%{&fileencoding}]%=%{fugitive#statusline()}\ %l/%L\ %c\ %P


" vim-gista
"--------------------------------
let g:gista#client#default_username = 'nabezokodaikon'


" nerdcommenter
"--------------------------------
" コメントの間にスペースを開ける
let NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle


" Previm.vim
"--------------------------------
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END


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

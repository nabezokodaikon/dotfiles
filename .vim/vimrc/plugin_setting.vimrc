"--------------------------------
" プラグイン設定 
"--------------------------------

" The-NERD-tree
"--------------------------------
" ツリーをトグル
nmap <silent> <C-e> :NERDTreeToggle<CR>

" 隠しファイルを表示する
" 0: 隠しファイルを表示しない
" 1: 隠しファイルを表示する
let g:NERDTreeShowHidden = 1


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


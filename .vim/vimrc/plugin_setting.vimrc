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

" unite.vim
"--------------------------------
" プレフィックスを f にする
nnoremap [unite] <Nop>
nmap     <Leader>f [unite]
" 表示時に The-NEAD-tree を閉じる
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR> :NERDTreeClose<CR>
nnoremap <silent> [unite]f :<C-u>Unite file<CR> :NERDTreeClose<CR>
nnoremap <silent> [unite]l :<C-u>Unite file_mru<CR> :NERDTreeClose<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR> :NERDTreeClose<CR>

" nerdcommenter
"--------------------------------
" コメントの間にスペースを開ける
let NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

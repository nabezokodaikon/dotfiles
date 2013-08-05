"--------------------------------
" プラグイン設定 
"--------------------------------

" The-NERD-tree
"--------------------------------
" <Ctrl-e>で、ツリーをトグル
nmap <silent> <C-e> :NERDTreeToggle<CR>

" 隠しファイルを表示する
" 0: 隠しファイルを表示しない
" 1: 隠しファイルを表示する
let g:NERDTreeShowHidden = 1

" unite.vim
"--------------------------------
nnoremap [unite] <Nop>
nmap     <Leader>f [unite]
nnoremap [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
nnoremap <silent> [unite]l :<C-u>Unite<Space>file_mru<CR>

" nerdcommenter
"--------------------------------
" コメントの間にスペースを開ける
let NERDSpaceDelims=1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle


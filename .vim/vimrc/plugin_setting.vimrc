"--------------------------------
" プラグイン設定 
"--------------------------------

" project.vim
"--------------------------------
" <Leader>Pで、プロジェクトをトグル
nmap <silent> <leader>P <plug>ToggleProject

" The-NERD-tree
"--------------------------------
" <Ctrl-e>で、ツリーをトグル
nmap <silent> <C-e> :NERDTreeToggle<CR>

" 隠しファイルを表示する
" 0: 隠しファイルを表示しない
" 1: 隠しファイルを表示する
let g:NERDTreeShowHidden = 1

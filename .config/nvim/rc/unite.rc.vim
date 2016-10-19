"--------------------------------
" unite.vim 設定 
"--------------------------------

" プレフィックスを <leader>u にする
nnoremap [unite] <Nop>
nmap     <leader>u [unite]

" file_rec/asyncとfile_rec/gitを自動的に切り換える
function! DispatchUniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git")
    Unite file_rec/git file/new -buffer-name=file -start-insert
  else
    Unite file_rec/async file/new -buffer-name=file -start-insert
  endif
endfunction

" 各種表示
" ファイル一覧 or git 管理ファイル一覧
nnoremap <silent> [unite]f :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer -no-start-insert<CR>
" アウトライン
nnoremap <silent> [unite]o :<C-u>Unite outline -start-insert<CR>
" gist 一覧
nnoremap <silent> [unite]s :<C-u>Unite gista -start-insert<CR>
" タブ一覧
nnoremap <silent> [unite]g :<C-u>Unite tab -no-start-insert<CR>
" タグ一覧
autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> [unite]t :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif

" action 選択時に、インサートモードで開始する。
call unite#custom#profile('action', 'context', {'start_insert' : 1})

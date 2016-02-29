"--------------------------------
" unite.vim 設定 
"--------------------------------

" プレフィックスを <Space>u にする
nnoremap [unite] <Nop>
nmap     <Space>u [unite]

" file_rec/asyncとfile_rec/gitを自動的に切り換える
function! DispatchUniteFileRecAsyncOrGit()
  if isdirectory(getcwd()."/.git")
    Unite -start-insert file_rec/git file/new -buffer-name=file
  else
    Unite -start-insert file_rec/async file/new -buffer-name=file
  endif
endfunction

" 各種表示
" ファイル一覧 or git 管理ファイル一覧
nnoremap <silent> [unite]f :<C-u>call DispatchUniteFileRecAsyncOrGit()<CR>
" 最近開いたファイル一覧
nnoremap <silent> [unite]h :<C-u>Unite -start-insert file_mru<CR>
" ディレクトリ一覧
nnoremap <silent> [unite]d :<C-u>Unite -start-insert directory_rec/async<CR>
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" アウトライン
nnoremap <silent> [unite]o :<C-u>Unite outline -no-start-insert<CR>
" gist 一覧
nnoremap <silent> [unite]s :<C-u>Unite -start-insert gista<CR>
" タブ一覧
nnoremap <silent> [unite]g :<C-u>Unite tab<CR>


" タグ一覧を表示するときに、カーソル下の単語に完全一致するタグのみを検索する
command!
\ -nargs=? PopupTags
\ |Unite -immediately tag:<args>
noremap <silent> [unite]t :<C-u>execute "PopupTags ".expand('<cword>')<CR>

" action 選択時に、インサートモードで開始する。
call unite#custom#profile('action', 'context', {'start_insert' : 1})

" unite grep に ag(The Silver Searcher) を使用する。
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


"--------------------------------
" unite.vim 設定 
"--------------------------------

" プレフィックスを <Leader>f にする
nnoremap [unite] <Nop>
nmap     <Space>f [unite]

" 各種表示
" ファイル一覧
nnoremap <silent> [unite]r :<C-u>Unite -start-insert file_rec/async file/new -buffer-name=file<CR>
" 最近開いたファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite -start-insert file_mru<CR>
" ディレクトリ一覧
nnoremap <silent> [unite]dr :<C-u>Unite -start-insert directory_rec/async<CR>
" 最近開いたディレクトリ一覧
nnoremap <silent> [unite]dm :<C-u>Unite -start-insert directory_mru<CR>
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" アウトライン
nnoremap <silent> [unite]o :<C-u>Unite outline -no-start-insert<CR>
" git 管理ファイル一覧 
nnoremap <silent> [unite]g :<C-u>Unite -start-insert file_rec/git file/new -buffer-name=file<CR>
" gist 一覧
nnoremap <silent> [unite]s :<C-u>Unite -start-insert gista<CR>

" タグ一覧を表示するときに、カーソル下の単語に完全一致するタグのみを検索する
command!
\ -nargs=? PopupTags
\ |Unite -immediately tag:<args>
noremap <silent> [unite]t :<C-u>execute "PopupTags ".expand('<cword>')<CR>

" action 選択時に、インサートモードで開始する。
call unite#custom#profile('action', 'context', {'start_insert' : 1})

" unite.vim からファイルを開くときに dwm で新しいウィンドウで開くようにする
let s:action = {
      \ 'description' : 'new dwm',
      \ 'is_selectable' : 1,
      \ }
function! s:action.func(candidates)
  for l:candidate in a:candidates
    call DWM_Focus()
    call unite#util#command_with_restore_cursor('rightbelow split')
    call unite#take_action('open', candidate)
  endfor
endfunction
call unite#custom_action('openable', 'dwm_new', s:action)
unlet s:action

" unite grep に ag(The Silver Searcher) を使用する。
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


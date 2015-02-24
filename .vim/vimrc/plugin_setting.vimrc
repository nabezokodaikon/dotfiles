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


" unite.vim
"--------------------------------
" プレフィックスを <Leader>f にする
nnoremap [unite] <Nop>
nmap     <Leader>f [unite]

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
" git 管理ファイル一覧 
nnoremap <silent> [unite]g :<C-u>Unite -start-insert file_rec/git file/new -buffer-name=file<CR>
" アウトライン
nnoremap <silent> [unite]o :<C-u>Unite outline -no-start-insert<CR>

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
    call DWM_New()
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


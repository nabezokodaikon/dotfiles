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

" プレフィックスを <Leader>f にする
nnoremap [unite] <Nop>
nmap     <Leader>f [unite]

" 各種表示
" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル、ディレクトリの一覧を再帰表示
nnoremap <silent> [unite]r :<C-u>Unite -start-insert directory_rec file_rec file/new -buffer-name=file<CR>
" 最近開いたファイルの一覧表示
nnoremap <silent> [unite]m :<C-u>Unite -start-insert file_mru<CR>
" アウトライン表示
nnoremap <silent> [unite]o :<C-u>Unite outline -no-start-insert<CR>

" タグ一覧を表示するときに、カーソル下の単語に完全一致するタグのみを検索する
command!
\ -nargs=? PopupTags
\ |Unite -immediately tag:<args>
noremap <silent> [unite]t :<C-u>execute "PopupTags ".expand('<cword>')<CR>


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


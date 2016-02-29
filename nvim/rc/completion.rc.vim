"--------------------------------
" 補完設定
"--------------------------------

" neocomplete.vim
"--------------------------------
" AutoComplPop プラグインを無効にする 
let g:acp_enableAtStartup = 0

" 起動時に有効にする
let g:neocomplete#enable_at_startup = 1

" 自動補完を開始するキーワードの長さ
let g:neocomplete#auto_completion_start_length = 3

" 大文字が入力されるまで、大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1

" シンタックスをキャッシュするときの最小文字長を 3 にする
let g:neocomplete#sources#syntax#min_keyword_length = 3

" 辞書ファイル
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'scala' : $HOME.'/.vim/dict/scala.dict'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" <C-h>や<BS>を押したときに確実にポップアップを削除する
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<BS>"

" 現在選択している候補を確定する
inoremap <expr><C-y> neocomplete#close_popup()

" 現在選択している候補をキャンセルし、ポップアップを閉じる
inoremap <expr><C-e> neocomplete#cancel_popup()

" 最初の候補を選択する
let g:neocomplete#enable_auto_select = 1

" TABで補完できるようにする
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" 補完候補が出ていたら確定、なければ改行する
inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : "<CR>"


" neosnippet-snippets.vim
"--------------------------------
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif


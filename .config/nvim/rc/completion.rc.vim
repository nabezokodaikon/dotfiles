"--------------------------------
" 補完設定
"--------------------------------

" deoplete.nvim
"--------------------------------
" AutoComplPop プラグインを無効にする 
let g:acp_enableAtStartup = 0

" deoplete を利用する
let g:deoplete#enable_at_startup = 1

" 自動補完を開始するキーワードの長さ
let g:deoplete#auto_completion_start_length = 3

" 大文字が入力されるまで、大文字小文字の区別を無視する
let g:deoplete#enable_smart_case = 1

" シンタックスをキャッシュするときの最小文字長を 3 にする
let g:deoplete#sources#syntax#min_keyword_length = 3

" 辞書ファイル
let g:deoplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'scala' : $HOME.'/.config/nvim/dict/scala.dict'
    \ }

" Define keyword.
if !exists('g:deoplete#keyword_patterns')
    let g:deoplete#keyword_patterns = {}
endif
let g:deoplete#keyword_patterns['default'] = '\h\w*'

" <C-h>や<BS>を押したときに確実にポップアップを削除する
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<BS>"

" TABで補完できるようにする
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
inoremap <silent><expr> <S-TAB>
    \ pumvisible() ? "\<C-p>" :
    \ <SID>check_back_space() ? "\<S-TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" 補完候補が出ていたら確定、なければ改行する
inoremap <expr><CR>  pumvisible() ? deoplete#mappings#close_popup() : "<CR>"

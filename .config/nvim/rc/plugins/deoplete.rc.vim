"--------------------------------
" deoplete.nvim configurations
"--------------------------------
" deoplete を利用する
let g:deoplete#enable_at_startup = 1

" 自動補完を開始するキーワードの長さ
let g:deoplete#auto_completion_start_length = 3

" 大文字が入力されるまで、大文字小文字の区別を無視する
let g:deoplete#enable_smart_case = 1

" シンタックスをキャッシュするときの最小文字長を 3 にする
let g:deoplete#sources#syntax#min_keyword_length = 3

if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns = {}
endif
let g:deoplete#omni_patterns.javascript = '[^. \t]\.\%(\h\w*\)\?'

if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.scala = [
            \ '[^. *\t]\.\w*',
            \ '[:\[,] ?\w*',
            \ '^import .*'
            \ ] 

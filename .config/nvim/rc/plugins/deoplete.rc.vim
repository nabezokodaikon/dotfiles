"--------------------------------
" deoplete.nvim configurations
"--------------------------------
" deoplete を利用する
let g:deoplete#enable_at_startup = 1

" 大文字が入力されるまで、大文字小文字の区別を無視する
let g:deoplete#enable_smart_case = 1

" 自動補完を開始するキーワードの長さ
call deoplete#custom#set('_', 'min_pattern_length', 3)


let g:deoplete#sources = {}
let g:deoplete#sources._ = [
            \ "buffer",
            \ "member",
            \ "tag",
            \ "file",
            \ "dictionary"
            \ ]
let g:deoplete#sources.html = [
            \ "buffer",
            \ "member",
            \ "tag",
            \ "file",
            \ "dictionary"
            \ ]
let g:deoplete#sources.css = [
            \ "buffer",
            \ "member",
            \ "tag",
            \ "file",
            \ "omni",
            \ "dictionary"
            \ ]
let g:deoplete#sources.javascript = [
            \ "buffer",
            \ "member",
            \ "tag",
            \ "file",
            \ "dictionary"
            \ ]
let g:deoplete#sources.scala = [
            \ "buffer",
            \ "member",
            \ "tag",
            \ "file",
            \ "omni",
            \ "dictionary"
            \ ]


let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.javascript = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.scala = [
            \ '[^. *\t]\.\w*',
            \ '[:\[,] ?\w*',
            \ '^import .*'
            \ ] 

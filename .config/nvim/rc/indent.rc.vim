"--------------------------------
" インデント設定
"--------------------------------
" 自動インデント
set autoindent
set smartindent

" 自動挿入されるタブ文字の長さを指定する
set shiftwidth=4

" タブキーで挿入されるタブ文字の長さを指定する
set softtabstop=4

" 既存のタブ文字の長さを指定する
set tabstop=4

" タブをスペースにする
set expandtab

if has("autocmd")
    filetype plugin on
    filetype indent on
    autocmd FileType scala  setlocal sw=2 sts=2 ts=2 et
    autocmd FileType play-template setlocal sw=2 sts=2 et
endif


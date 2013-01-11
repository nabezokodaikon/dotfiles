" スワップファイルを作成しない
:set noswapfile

" バックアップファイルを作成しない
:set nobackup

" 行頭、行末の回り込みを許可
" b     delete キー Normal,Visual
" s     space キー  Normal,Visual
" h     H キー      Normal,Visual
" l     L キー      Normal,Visual
" <     左キー      Normal,Visual 
" >     右キー      Normal,Visual
" ~     ^ キー      Normal
" [     [ キー      Insert,Replace
" ]     ] キー      Insert,Replace
set whichwrap=b,s,h,l,<,>,[,]

" タブをスペースにする
set expandtab

" 既存のタブ文字の長さを指定する
set tabstop=4

" 自動挿入されるタブ文字の長さを指定する
set shiftwidth=4

" タブキーで挿入されるタブ文字の長さを指定する
set softtabstop=4

" 改行時のインデントを現在行と同じにする
set autoindent

" 行番号を表示する
set number

" シンタックスハイライトを有効
syntax on

" インクリメンタル検索有効
set incsearch

" 検索結果をハイライト
set nohlsearch

" 現在の行を強調しない
set nocursorline

" 補完機能有
set wildmenu wildmode=list:full

" ステータスラインを常に表示する
set laststatus=2

" ステータスラインの書式
set statusline=%F%=%l/%L%4c%8P

" クリップボード連携
set clipboard=unnamed,autoselect

" 自動改行させない
" デフォルト vimrc_example の textwidth 設定を上書き
autocmd FileType text setlocal textwidth=0

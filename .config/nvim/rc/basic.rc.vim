"--------------------------------
" 基本設定
"--------------------------------

" unity on cursor to the block 
set guicursor=a:block

" スワップファイルを作成しない
set noswapfile

" バックアップファイルを作成しない
set nobackup

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

" カーソルを点滅させない。
set guicursor=a:blinkon0

" 行番号を表示する
set number

" 常にタブラインを表示する。
set showtabline=2

" 常にsigncolumnを表示する。
set signcolumn=yes

" vim-airlineを使用するため、現在のモードを非表示にする。
set noshowmode

" シンタックスハイライトを有効
syntax on

" インクリメンタル検索有効
set incsearch

" 検索結果をハイライトする
set hlsearch

" 現在の行を強調する
set cursorline

" 現在の列を強調する
set cursorcolumn

" ステータスラインを常に表示する
set laststatus=2

" ポップアップの行数
set pumheight=10

" Set the behavior at the time of complementation
set completeopt=menuone,noinsert,noselect

" プレビューウィンドウを表示しない。
set completeopt-=preview

" 自動改行させない
set textwidth=0

" 挿入モードへ戻るときの esc キーの反応を早くする
set ttimeoutlen=0

" 保存されていないファイルがあるときでも別のファイルを開く
set hidden

" マウスを無効化
set mouse=

" 外部で変更のあったファイルを自動的に読みなおす
set autoread

" クリップボードと連携
set clipboard^=unnamedplus

" ターミナルで使用するシェルを指定
if IsWindows()
    " set shell=/bin/sh
else
    set shell=/bin/sh
endif


" インデント設定(規定値) 
"--------------------------------
" 新しい行の自動インデントを有効化。
set autoindent

" 新しい行の高度な自動インデントを有効化。
set smartindent

" タブ入力を空白入力に置き換える。
set expandtab

" shiftwidthの設定を有効化。
set smarttab

" タブ入力で挿入される空白の長さをshiftwidthと同じにする。
set softtabstop=-1


" 置換設定
"--------------------------------
" 文字列置換をインタラクティブに表示する。
if (has('nvim'))
    set inccommand=split
endif


" floating windows
"--------------------------------
" ターミナルでも True Color を使えるようにする。
set termguicolors

"--------------------------------
" 基本設定
"--------------------------------
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

" 行番号を表示する
set number

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

" 補完機能有
set wildmenu wildmode=list:full

" ステータスラインを常に表示する
set laststatus=2

" ステータスラインの書式
" *要 vim-fugitive
set statusline=%F\ [%Y][%{&fileencoding}]%=%{fugitive#statusline()}\ %l/%L\ %c\ %P

" クリップボード連携
set clipboard=unnamed,autoselect

" 自動改行させない
" デフォルト vimrc_example の textwidth 設定を上書き
autocmd FileType text setlocal textwidth=0

" 挿入モードへ戻るときの esc キーの反応を早くする
set ttimeoutlen=0

" <C-j> で挿入モードから抜ける(ESCと同じ動作)
imap <C-j> <esc>

" <Leader> を <Space> に変更
let mapleader = "\<Space>"

" 保存されていないファイルがあるときでも別のファイルを開く
set hidden

" マウスを無効化
set mouse=

" 外部で変更のあったファイルを自動的に読みなおす
set autoread

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

" 常にタブラインを表示する。
set showtabline=2

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

" 自動改行させない
" デフォルト vimrc_example の textwidth 設定を上書き
autocmd FileType text setlocal textwidth=0

" 挿入モードへ戻るときの esc キーの反応を早くする
set ttimeoutlen=0

" 保存されていないファイルがあるときでも別のファイルを開く
set hidden

" マウスを無効化
set mouse=

" 外部で変更のあったファイルを自動的に読みなおす
set autoread

" クリップボードと連携
set clipboard+=unnamedplus

" 256色を有効化。
set t_Co=256


" インデント設定(規定値) 
"--------------------------------
" 新しい行の自動インデントを有効化。
set autoindent

" 新しい行の高度な自動インデントを有効化。
set smartindent

" タブ入力を空白入力に置き換える。
set expandtab

" ファイル内のタブが対応する空白の数。
set tabstop=4

" shiftwidthの設定を有効化。
set smarttab

" 自動インデントの空白の長さ。
set shiftwidth=4

" タブ入力で挿入される空白の長さをshiftwidthと同じにする。
set softtabstop=-1


" tagsファイル読み込み
"--------------------------------
set tags=tags
" ~/dotfiles/tags/ ディレクトリに絶対パスで作成したタグファイルを
" 拡張子'.tags'で作成することで vim 起動時に自動で読み込まれる。
" <例>
" $ ctags -f ~/dotfiles/tags/scala.tags -R /usr/local/github/scala/src
if exists('g:loaded_tags')
    finish
endif
execute ":set tags+=" . join(split(glob("~/dotfiles/tags/*.tags"), "\n"), ",")
let g:loaded_tags = 1

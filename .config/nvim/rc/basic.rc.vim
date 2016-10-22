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

" 補完機能有
set wildmenu wildmode=list:full

" ステータスラインを常に表示する
set laststatus=2

" 自動改行させない
" デフォルト vimrc_example の textwidth 設定を上書き
autocmd FileType text setlocal textwidth=0

" 挿入モードへ戻るときの esc キーの反応を早くする
set ttimeoutlen=0

" <C-j> で挿入モードから抜ける(ESCと同じ動作)
inoremap <silent> <C-j> <esc>

" <leader> を <space> に変更
let mapleader = "\<space>"

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


" denite.nvim key mapping
"--------------------------------
" Prefix
nnoremap [denite] <nop>
nmap <leader>u [denite]

" ファイル一覧
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>

" ファイル表示履歴
nnoremap <silent> [denite]h :<C-u>Denite file_mru<CR>

" yank一覧
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>

" ファイル内の行検索
nnoremap <silent> [denite]l :<C-u>Denite line<CR>

" grep
nnoremap <silent> [denite]r :<C-u>DeniteCursorWord grep<CR>

" バッファ一覧
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>


" unite.vim key mapping
"--------------------------------
" アウトライン
nnoremap <silent> [denite]o :<C-u>Unite outline -start-insert<CR>

" gist 一覧
nnoremap <silent> [denite]s :<C-u>Unite gista -start-insert<CR>

" タブ一覧
nnoremap <silent> [denite]g :<C-u>Unite tab -no-start-insert<CR>

" タグ一覧
augroup vimrc-unite-tag
    autocmd!
    autocmd BufEnter *
                \   if empty(&buftype)
                \|      nnoremap <buffer> [denite]t :<C-u>UniteWithCursorWord -immediately tag<CR>
                \|  endif
augroup END

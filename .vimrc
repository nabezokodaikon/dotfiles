"--------------------------------
" Vim設定
"--------------------------------
filetype off
filetype plugin indent off


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


"--------------------------------
" ステータスライン
"--------------------------------
set statusline=%F\ [%Y][%{&fileencoding}]%=%l/%L\ %c\ %P


"--------------------------------
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


"--------------------------------
" カラー設定
"--------------------------------
set t_Co=256


"--------------------------------
" tab 設定
"--------------------------------
" tmux のタブ(ウィンドウ操作に合わせる)
" 新しいタブを開く
nnoremap gn <Nop>
nnoremap gn :tabnew<CR>

" 現在のタブを閉じる
nnoremap gc <Nop>
nnoremap gc :tabclose<CR>

" タブページを常に表示
set showtabline=2

" タブラインをカスタマイズ
set tabline=%!MakeTabLine()

function! MakeTabLine()
    let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
    let sep = '|'  
    let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
    let info = fnamemodify(getcwd(), ":~") . ' '
    return tabpages . '%=' . info  
endfunction

function! s:tabpage_label(n)

    " t:title と言う変数があったらそれを使う。
    let title = gettabvar(a:n, 'title')
    if title !=# ''
        return title
    endif

    " タブページ内のバッファのリストを取得する。
    let bufnrs = tabpagebuflist(a:n)

    " バッファ名を設定する。
    let bufnr = bufnrs[tabpagewinnr(a:n) - 1]
    let bufname = bufname(bufnr)
    if bufname == ''
        let bufname = '[No Name]'
    else
        let bufname = fnamemodify(bufname, ":t")
    endif

    " バッファが複数存在する場合、バッファ数を表示する。
    let no = len(bufnrs)
    if no is 1
        let no = ''
    endif
    
    " タブページ内に変更ありのバッファが存在する場合、'+' を表示する。
    let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
    let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける

    " ハイライトを切り替え。
    let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

    return hi . ' ' . no . mod . sp . bufname . ' ' . '%T%#TabLineFill#'
endfunction


"--------------------------------
" split 設定
"--------------------------------
" 新規ウィンドウで空ファイルを開くとき、垂直分割して開く。
nnoremap <C-w>n <Nop>
nnoremap <C-w><C-n> <Nop>
nnoremap <C-w>n :vne<CR>
nnoremap <C-w><C-n> :vne<CR>


filetype plugin indent on

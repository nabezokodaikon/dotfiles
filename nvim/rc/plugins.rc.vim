" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
call dein#begin(s:dein_dir)

" プラグインリストを収めた TOML ファイル
let s:toml      = '~/.config/nvim/plugins/dein.toml'

" TOML を読み込み、キャッシュしておく
if dein#load_cache([expand('<sfile>'), s:toml])
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#save_cache()
endif

" 設定終了
call dein#end()

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

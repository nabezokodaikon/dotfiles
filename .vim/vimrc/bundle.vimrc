"--------------------------------
" neobundle で管理しているプラグインを読み込む
"--------------------------------
set nocompatible

filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" start plugins

" プラグイン管理
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'

" 自動補完
NeoBundle 'git://github.com/Shougo/neocomplcache.git'

" Scala のシンタックスハイライト
NeoBundle 'git://github.com/derekwyatt/vim-scala.git'

" ツリー型ファイラー
NeoBundle 'git://github.com/vim-scripts/The-NERD-tree.git'

" end plugins

filetype plugin indent on

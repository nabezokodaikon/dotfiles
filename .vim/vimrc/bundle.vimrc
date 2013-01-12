"--------------------------------
" neobundle で管理しているプラグインを読み込む
"--------------------------------
set nocompatible

filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" start plugins

" プラグイン管理
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'

" Scala のシンタックスハイライト
NeoBundle 'git://github.com/derekwyatt/vim-scala.git'

" end plugins

filetype plugin indent on

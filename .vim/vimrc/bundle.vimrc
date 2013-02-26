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
NeoBundle 'https://github.com/Shougo/neobundle.vim.git'

" 自動補完
NeoBundle 'https://github.com/Shougo/neocomplcache.git'

" Scala のシンタックスハイライト
NeoBundle 'https://github.com/derekwyatt/vim-scala.git'

" ツリー型ファイラー
NeoBundle 'https://github.com/vim-scripts/The-NERD-tree.git'

" zencoding
NeoBundle 'https://github.com/mattn/zencoding-vim.git'

" unite.vim
NeoBundle 'https://github.com/Shougo/unite.vim.git'

" end plugins

filetype plugin indent on

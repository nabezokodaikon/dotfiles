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

" コメントアウト
NeoBundle 'https://github.com/scrooloose/nerdcommenter.git'

" unite.vim
NeoBundle 'https://github.com/Shougo/unite.vim.git'

" vimproc
NeoBundle 'https://github.com/Shougo/vimproc.git', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

" dwm.vim
NeoBundle 'https://github.com/spolu/dwm.vim.git'

" Color Scheme
NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'https://github.com/w0ng/vim-hybrid.git'
NeoBundle 'https://github.com/nanotech/jellybeans.vim.git'

" クリップボード連携
NeoBundle 'https://github.com/kana/vim-fakeclip.git'

" end plugins

filetype plugin indent on

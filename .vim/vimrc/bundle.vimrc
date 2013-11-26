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

" vimproc
NeoBundle 'https://github.com/Shougo/vimproc.git', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

" 自動補完
NeoBundle 'https://github.com/Shougo/neocomplcache.git'

" unite.vim
NeoBundle 'https://github.com/Shougo/unite.vim.git'

" unite-outline
NeoBundle 'https://github.com/nabezokodaikon/unite-outline.git'

" unite-tag
NeoBundle 'https://github.com/tsukkee/unite-tag.git'

" unite-vim_hacks
NeoBundle 'https://github.com/mattn/webapi-vim.git'
NeoBundle 'https://github.com/mattn/wwwrenderer-vim.git'
NeoBundle 'https://github.com/thinca/vim-openbuf.git'
NeoBundle 'https://github.com/choplin/unite-vim_hacks.git'

" クリップボード連携
NeoBundle 'https://github.com/kana/vim-fakeclip.git'

" ツリー型ファイラー
NeoBundle 'https://github.com/vim-scripts/The-NERD-tree.git'

" dwm.vim
NeoBundle 'https://github.com/spolu/dwm.vim.git'

" emmet-vim
NeoBundle 'https://github.com/mattn/emmet-vim.git'

" tagbar
NeoBundle 'https://github.com/majutsushi/tagbar.git'

" コメントアウト
NeoBundle 'https://github.com/scrooloose/nerdcommenter.git'

" Color Scheme
NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'https://github.com/w0ng/vim-hybrid.git'
NeoBundle 'https://github.com/nanotech/jellybeans.vim.git'

" Scala のシンタックスハイライト
NeoBundle 'https://github.com/derekwyatt/vim-scala.git'

" スニペット
NeoBundle 'https://github.com/drmingdrmer/xptemplate.git'

" end plugins

filetype plugin indent on

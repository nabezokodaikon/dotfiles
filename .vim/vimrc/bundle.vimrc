"--------------------------------
" neobundle で管理しているプラグインを読み込む
"--------------------------------
set nocompatible

filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

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
NeoBundle 'https://github.com/Shougo/neocomplete.git'

" スニペット
NeoBundle 'https://github.com/Shougo/neosnippet.git'
NeoBundle 'https://github.com/Shougo/neosnippet-snippets.git'

" unite.vim
NeoBundle 'https://github.com/Shougo/unite.vim.git'

" neomru.vim
NeoBundle 'https://github.com/Shougo/neomru.vim.git'

" unite-outline
NeoBundle 'https://github.com/nabezokodaikon/unite-outline.git'

" unite-tag
NeoBundle 'https://github.com/tsukkee/unite-tag.git'

" クリップボード連携
NeoBundle 'https://github.com/kana/vim-fakeclip.git'

" dwm.vim
NeoBundle 'https://github.com/spolu/dwm.vim.git'

" emmet-vim
NeoBundle 'https://github.com/mattn/emmet-vim.git'

" surround.vim
" テキストを囲ったり、囲いを外したりするプラグイン。
NeoBundle 'https://github.com/tpope/vim-surround.git'

" tagbar
NeoBundle 'https://github.com/majutsushi/tagbar.git'

" auto-ctags.vim
NeoBundle 'https://github.com/soramugi/auto-ctags.vim.git'

" コメントアウト
NeoBundle 'https://github.com/scrooloose/nerdcommenter.git'

" Color Scheme
NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'https://github.com/w0ng/vim-hybrid.git'
NeoBundle 'https://github.com/nanotech/jellybeans.vim.git'

" Scala のシンタックスハイライト
NeoBundle 'https://github.com/derekwyatt/vim-scala.git'

" Markdown
NeoBundle 'https://github.com/tyru/open-browser.vim.git'
NeoBundle 'https://github.com/kannokanno/previm.git'

" submode.vim
" ユーザが自由にサブモードを定義できるプラグイン。
" タブ操作をカスタマイズするのに使用している。
NeoBundle 'https://github.com/kana/vim-submode.git'

" vim-gista
" vim で gist を使用する。
NeoBundleLazy 'https://github.com/lambdalisue/vim-gista.git', {
    \ 'autoload': {
    \    'commands': ['Gista'],
    \    'mappings': '<Plug>(gista-',
    \    'unite_sources': 'gista',
    \}}

" タブごとにカレントディレクトリを切り替える。
NeoBundle 'https://github.com/kana/vim-tabpagecd.git'

" grep の高速版 ag(The Silver Searcher)
NeoBundle 'https://github.com/rking/ag.vim.git'

" Fcitx 環境でインサートモードからノーマルモードになると、Fcitx が OFF になる。
NeoBundle 'https://github.com/anekos/felis-cat-igirisu-toast-express.git'

" カラースキーム使用時に背景を端末と同じにする。(透過している場合は透過する。)
NeoBundle 'https://github.com/miyakogi/seiya.vim.git'

" end plugins
call neobundle#end()

filetype plugin indent on

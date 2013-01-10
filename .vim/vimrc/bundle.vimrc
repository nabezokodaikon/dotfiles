set nocompatible

filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" start plugins
" NeoBundle 'git://github.com/vim-scripts/project.vim.git'
" end plugins

filetype plugin indent on

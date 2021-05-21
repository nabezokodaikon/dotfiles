if &compatible
    set nocompatible
endif

filetype off
filetype plugin indent off

let $CACHE = expand('~/.cache')
if !isdirectory(expand($CACHE))
    call mkdir(expand($CACHE), 'p')
endif
let s:dein_dir = expand('$CACHE/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif
if !dein#load_state(s:dein_dir)
    finish
endif
call dein#begin(s:dein_dir, expand('<sfile>'))
call dein#add('Shougo/deoplete.nvim')
call dein#add('~/workspace/src/deoplete-lsp')
call dein#add('neovim/nvim-lspconfig')
call dein#end()
call dein#save_state()
if has('vim_starting') && dein#check_install()
    call dein#install()
endif

filetype plugin indent on

call deoplete#enable()
lua require'lspconfig'.rust_analyzer.setup {}

"--------------------------------
" Initial configurations
"--------------------------------
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
call dein#add('Shougo/deoplete-lsp')
call dein#add('lifepillar/vim-solarized8')
call dein#add('godlygeek/tabular')
call dein#add('neovim/nvim-lspconfig')
" call dein#add('nabezokodaikon/nvim-lspconfig', { 'rev': 'hotfix-enable_rust_analyzer_default_settings' })
" call dein#add('nvim-lua/diagnostic-nvim')

" call dein#load_toml('~/.config/nvim/rc/dein.toml', {'lazy': 0})
" call dein#load_toml('~/.config/nvim/rc/deinlazy.toml', {'lazy': 1})

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

let g:deoplete#enable_at_startup = 1
lua require'nvim_lsp'.cmake.setup{}
lua require'nvim_lsp'.clangd.setup{}

if (has("termguicolors"))
    set termguicolors
endif
set background=light
colorscheme solarized8

inoremap jj <ESC>

filetype plugin indent on

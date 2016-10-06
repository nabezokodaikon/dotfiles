" dein configurations.

let $CACHE = expand('~/.cache')
if !isdirectory(expand($CACHE))
    call mkdir(expand($CACHE), 'p')
endif

let s:path = expand('$CACHE/dein')

" Load dein.
let s:dein_dir = finddir('dein.vim', '.;')
if s:dein_dir != '' || &runtimepath !~ '/dein.vim'
    if s:dein_dir == '' && &runtimepath !~ '/dein.vim'
        let s:dein_dir = expand(s:path) . '/repos/github.com/Shougo/dein.vim'
        if !isdirectory(s:dein_dir)
            execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
        endif
    endif
    execute ' set runtimepath^=' . substitute(fnamemodify(s:dein_dir, ':p') , '/$', '', '')
endif

if &compatible
    set nocompatible
endif

if !dein#load_state(s:path)
    filetype plugin indent on
    finish
endif

let s:toml_path = '~/.config/nvim/plugins/dein.toml'

call dein#begin(s:dein_dir, [expand('<sfile>'), s:toml_path])

call dein#load_toml(s:toml_path, {'lazy': 0})

call dein#end()
call dein#save_state()

" Installation check.
if has('vim_starting') && dein#check_install()
    call dein#install()
endif

filetype plugin indent on

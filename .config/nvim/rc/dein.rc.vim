"--------------------------------
" dein.nvim configurations.
"--------------------------------
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

if !dein#load_state(s:path)
    finish
endif

call dein#begin(s:dein_dir)

call dein#load_toml('~/.config/nvim/rc/dein.toml', {'lazy': 0})
call dein#load_toml('~/.config/nvim/rc/deinlazy.toml', {'lazy': 1})

call dein#end()
call dein#save_state()

" Installation check.
if has('vim_starting') && dein#check_install()
    call dein#install()
endif

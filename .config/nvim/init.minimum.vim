if &compatible
    set nocompatible
endif
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

call dein#begin(s:dein_dir, expand('<sfile>'))
call dein#add('Shougo/denite.nvim')
call dein#add('neovim/nvim-lspconfig')
call dein#add('nvim-lua/completion-nvim')
call dein#add('hrsh7th/nvim-compe')
call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

lua << EOF
vim.o.completeopt="menuone,noinsert,noselect"
require'lspconfig'.denols.setup{on_attach = require'completion'.on_attach}
require'compe'.setup {
    enabled = true;
    autocomplete = true;
    source = {
        path = true;
        buffer = true;
        nvim_lsp = true;
    };
}
EOF

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
endfunction
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
endfunction

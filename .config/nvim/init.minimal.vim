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

call dein#add('nabezokodaikon/nvim-lspconfig', { 'rev': 'hotfix-enable_rust_analyzer_default_settings' })
call dein#add('nvim-lua/diagnostic-nvim')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/deoplete-lsp')

" call dein#load_toml('~/.config/nvim/rc/dein.toml', {'lazy': 0})
" call dein#load_toml('~/.config/nvim/rc/deinlazy.toml', {'lazy': 1})

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
    call dein#install()
endif

lua require'nvim_lsp'.tsserver.setup{on_attach=require'diagnostic'.on_attach}

inoremap jj <ESC>

"--------------------------------	
" deoplete.nvim	
"--------------------------------	
" deniteのフィルターの補完を無効にする。
call deoplete#custom#option('keyword_patterns', {	
   \ 'denite-filter': '',	
   \})	

call deoplete#custom#option({
    \ 'min_pattern_length': 1,
    \})

call deoplete#custom#option('sources', {
    \ 'css': ['buffer', 'lsp'],
    \ 'html': ['buffer', 'file', 'lsp'],
    \ 'graphql': ['buffer'],
    \ 'javascript': ['buffer', 'lsp'],
    \ 'javascript.jsx': ['buffer', 'lsp'],
    \ 'typescript': ['buffer', 'lsp'],
    \ 'typescript.tsx': ['buffer', 'lsp'],
    \})
   
" 補完の余計な文字を除去する。
call deoplete#custom#source('_', 'converters', [
    \ 'converter_remove_paren',
    \ 'converter_remove_overlap',
    \ 'converter_truncate_abbr',
    \ 'converter_truncate_info',
    \ 'converter_truncate_menu',
    \ 'converter_auto_delimiter',
    \])

" 入力以下の候補を削除する。
call deoplete#custom#source('_',
    \ 'matchers', ['matcher_fuzzy', 'matcher_length'])

" 補完候補からスニペットを除外する。
call deoplete#custom#source('lsp', 'converters', ['converter_reorder_attr'])
call deoplete#custom#filter('converter_reorder_attr', 'attrs_order', {
    \ 'rust': { 'kind': ['!Snippet'] }
    \})
call deoplete#custom#source('LanguageClient', 'converters', ['converter_reorder_attr'])
call deoplete#custom#filter('converter_reorder_attr', 'attrs_order', {
    \ 'haxe': { 'kind': ['!Snippet'] }
    \})

call deoplete#custom#source('lsp', 'dup', v:false)
call deoplete#custom#source('LC', 'dup', v:false)

" Enterで補完を決定する。
inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"

" <C-e>でポップアップウィンドウをキャンセルして閉じる。
inoremap <expr><C-e> deoplete#cancel_popup()

call deoplete#enable()

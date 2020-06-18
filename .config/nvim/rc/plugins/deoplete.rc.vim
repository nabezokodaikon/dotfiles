"--------------------------------	
" deoplete.nvim	
"--------------------------------	
" deniteのフィルターの補完を無効にする。
call deoplete#custom#option('keyword_patterns', {	
   \ 'denite-filter': '',	
   \})	

" call deoplete#custom#option({	
    " \ 'smart_case': v:true,	
   " \})	

" call deoplete#custom#option('keyword_patterns', {	
   " \ '_': '[a-zA-Z_]\k*',	
   " \ 'denite-filter': '',	
   " \ 'haxe': '',	
   " \ 'rust': '',	
   " \ 'scala': '',	
   " \ 'typescript': ''	
   " \})	

" call deoplete#custom#option('keyword_patterns', {	
   " \ '_': '[a-zA-Z_]\k*',	
   " \ 'denite-filter': '',	
   " \})	

" call deoplete#custom#var('omni', 'input_patterns', {
    " \ 'haxe': '[^. *\t]\.\w*',
    " \ })

" call deoplete#custom#option('omni_patterns', {
    " \ 'haxe': '[^. *\t]\.\w*'
    " \})

" call deoplete#custom#var('omni', 'input_patterns', {
    " \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
    " \ 'haxe': '[^. *\t]\.\w*',
    " \ 'php': '\w+|[^. \t]->\w*|\w+::\w*',
    " \})

" call deoplete#custom#option('sources', {
    " \ 'hexe': ['omni', 'dictionary'],
    " \ 'scala': ['omni', 'dictionary'],

call deoplete#custom#var('omni', 'input_patterns', {
    \ 'haxe': '\v([\]''"\)]|\w|(^\s*))(\.|\()',
    \ 'scala': [
    \     '[^. *\t]\.\w*',
    \     '[:\[,] ?\w*',
    \     '^import .*'
    \   ],
    \ 'rust': '(\.|::|->)\w',
    \})

call deoplete#custom#option('min_pattern_length', 2)

call deoplete#custom#option('sources', {
    \ 'scala': ['buffer', 'dictionary', 'lsp'],
    \ 'rust': ['buffer', 'dictionary', 'lsp'],
    \ 'python': ['buffer', 'dictionary', 'lsp'],
    \})
   
" 補完の余計な文字を除去する。
call deoplete#custom#source('_', 'converters', [
    \ 'converter_remove_paren',
    \ 'converter_remove_overlap',
    \ 'converter_truncate_abbr',
    \ 'converter_truncate_info',
    \ 'converter_truncate_menu',
    \ 'converter_auto_delimiter'
    \])

" 補完候補からスニペットを除外する。
call deoplete#custom#source('LanguageClient', 'converters', ['converter_reorder_attr'])
call deoplete#custom#filter('converter_reorder_attr', 'attrs_order', {
    \ 'haxe': {
    \    'kind': [
    \      '!Snippet'
    \    ]
    \ }
    \})

" プレビューウィンドウを表示しない。
set completeopt-=preview

" Enterで補完を決定する。
inoremap <expr><CR>  pumvisible() ? deoplete#close_popup() : "<CR>"

" TABで補完を決定する。
inoremap <expr><TAB>  pumvisible() ? deoplete#close_popup() : "<TAB>"

" ログ出力(カレントディレクトリに出力される。)
" call deoplete#custom#option('profile', v:true)
" call deoplete#enable_logging('DEBUG', 'deoplete.log')
" call deoplete#custom#source('LanguageClient', 'is_debug_enabled', 1)

call deoplete#enable()

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

" call deoplete#custom#var('omni', 'input_patterns', {
    " \ 'haxe': '\v([\]''"\)]|\w|(^\s*))(\.|\()',
    " \ 'scala': [
    " \     '[^. *\t]\.\w*',
    " \     '[:\[,] ?\w*',
    " \     '^import .*'
    " \   ]
    " \})

call deoplete#custom#source('_',
    \ 'matchers', ['matcher_fuzzy', 'matcher_length'])

call denite#custom#source('file_mru',
    \ 'matchers', ['matcher/fuzzy', 'matcher/project_files'])

call deoplete#custom#option('sources', {
    \ 'hexe': ['buffer', 'dictionary', 'LanguageClient'],
    \ 'scala': ['buffer', 'dictionary', 'LanguageClient'],
    \ 'rust': ['buffer', 'dictionary', 'LanguageClient'],
    \})
   
" 補完の余計な文字を除去する。
call deoplete#custom#source('_', 'converters', [
    \ 'converter_remove_paren',
    \ 'converter_remove_overlap',
    \ 'matcher_length',
    \ 'converter_truncate_abbr',
    \ 'converter_truncate_info',
    \ 'converter_truncate_menu',
    \ 'converter_auto_delimiter',
    \])

call deoplete#enable()	

inoremap <expr><CR>  pumvisible() ? deoplete#mappings#close_popup() : "<CR>"

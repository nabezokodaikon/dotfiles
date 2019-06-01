"--------------------------------	
" deoplete.nvim	
"--------------------------------	
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

call deoplete#custom#var('omni', 'input_patterns', {
    \ 'haxe': '[^. *\t]\.\w*',
    \ })

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
    " \ 'scala': ['buffer', 'file', 'member', 'omni', 'dictionary', 'tag'],
    " \})

" call deoplete#custom#var('omni', 'input_patterns', {
    " \ 'haxe': '\v([\]''"\)]|\w|(^\s*))(\.|\()',
    " \ 'scala': [
    " \     '[^. *\t]\.\w*',
    " \     '[:\[,] ?\w*',
    " \     '^import .*'
    " \   ]
    " \})

" call deoplete#custom#source('_', 	
   " \ 'matchers', ['matcher_head'])	

call deoplete#enable()	

inoremap <expr><CR>  pumvisible() ? deoplete#mappings#close_popup() : "<CR>"

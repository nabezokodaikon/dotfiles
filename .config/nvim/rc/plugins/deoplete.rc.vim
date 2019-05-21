"--------------------------------
" deoplete.nvim
"--------------------------------
call deoplete#custom#option({
    \ 'smart_case': v:true,
    \})

call deoplete#custom#option('keyword_patterns', {
    \ '_': '[a-zA-Z_]\k*',
    \ 'deoplete': ''
    \ 'haxe': ''
    \})

call deoplete#custom#option('sources', {
    \ 'scala': ['buffer', 'file', 'member', 'omni', 'dictionary', 'tag'],
    \})

call deoplete#custom#source('_', 
    \ 'matchers', ['matcher_head'])

call deoplete#custom#var('omni', 'input_patterns', {
    \ 'scala': [
    \     '[^. *\t]\.\w*',
    \     '[:\[,] ?\w*',
    \     '^import .*'
    \   ]
    \})

call deoplete#enable()

inoremap <expr><CR>  pumvisible() ? deoplete#mappings#close_popup() : "<CR>"

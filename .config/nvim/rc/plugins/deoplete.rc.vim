"--------------------------------
" deoplete.nvim
"--------------------------------
call deoplete#custom#option({
    \ 'smart_case': v:true,
    \})

call deoplete#custom#option('keyword_patterns', {
    \ '_': '[a-zA-Z_]\k*',
    \ 'denite-filter': '',
    \ 'haxe': '',
    \ 'rust': '',
    \ 'scala': '',
    \ 'typescript': ''
    \})

call deoplete#custom#source('_', 
    \ 'matchers', ['matcher_head'])

call deoplete#enable()

inoremap <expr><CR>  pumvisible() ? deoplete#mappings#close_popup() : "<CR>"

"--------------------------------	
" deoplete.nvim	
"--------------------------------	
call ddc#custom#patch_global(
    \ 'sources', [
    \     'nvimlsp',
    \     'around',
    \ ])

call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })

call ddc#custom#patch_global('sourceOptions', {
      \ '_': {'minAutoCompleteLength': 2},
      \ 'around': {'mark': 'buf'},
      \ 'nvimlsp': {'mark': 'lsp'},
      \ })

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ "\<TAB>" : ddc#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

call ddc#enable()

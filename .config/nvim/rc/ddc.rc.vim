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
    \ '_': {'minAutoCompleteLength': 1},
    \ 'around': {'mark': 'buf'},
    \ 'nvimlsp': {'mark': 'lsp'},
    \ })

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ "\<TAB>" : ddc#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Confirm the completion and close the pop-up.
" If you want to cancel the completion, it defaults to <C-e>.
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"

" Number of pop-up lines.
set pumheight=10

" Pop-up behavior.
set completeopt=menuone

" Make the pop-up menu translucent.
set pumblend=15

call ddc#enable()

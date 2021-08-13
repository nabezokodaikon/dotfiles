"--------------------------------	
" deoplete.nvim	
"--------------------------------	
call ddc#custom#patch_global(
    \ 'sources', ['around']
    \ )

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ "\<TAB>" : ddc#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

call ddc#enable()

"autocmd WinEnter,BufEnter *
    "\ if expand("%") != "TelescopePrompt"
    "\| call ddc#enable() | else
    "\| call ddc#disable() | endif

" augroup ddc_enable-disable
    " autocmd!
    " "autocmd BufRead,BufNewFile * call ddc#enable()<CR>
    " "autocmd BufRead,BufNewFile TelescopePrompt call ddc#disable()<CR>
" augroup END

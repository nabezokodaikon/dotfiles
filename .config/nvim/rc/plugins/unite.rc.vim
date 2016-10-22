"--------------------------------
" unite.vim configurations
"--------------------------------
" アウトライン
nnoremap <silent> [denite]o :<C-u>Unite outline -start-insert<CR>

" gist 一覧
nnoremap <silent> [denite]s :<C-u>Unite gista -start-insert<CR>

" タブ一覧
nnoremap <silent> [denite]g :<C-u>Unite tab -no-start-insert<CR>

" タグ一覧
augroup vimrc-unite-tag
    autocmd!
    autocmd BufEnter *
                \   if empty(&buftype)
                \|      nnoremap <buffer> [denite]t :<C-u>UniteWithCursorWord -immediately tag<CR>
                \|  endif
augroup END

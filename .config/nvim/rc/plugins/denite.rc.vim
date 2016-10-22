"--------------------------------
" denite.nvim configurations
"--------------------------------
" Prefix
nnoremap [denite] <nop>
nmap <leader>u [denite]

" ファイル一覧
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>

" ファイル表示履歴
nnoremap <silent> [denite]h :<C-u>Denite file_mru<CR>

" yank一覧
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>

" ファイル内の行検索
nnoremap <silent> [denite]l :<C-u>Denite line<CR>

" grep
nnoremap <silent> [denite]r :<C-u>DeniteCursorWord grep<CR>

" バッファ一覧
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>

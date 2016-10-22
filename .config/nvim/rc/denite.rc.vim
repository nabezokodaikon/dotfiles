"--------------------------------
" denite.nvim 設定 
"--------------------------------
" キーマッピング
call denite#custom#map('insert', "\<C-n>", 'move_to_next_line')
call denite#custom#map('insert', "\<C-p>", 'move_to_prev_line')
call denite#custom#map('insert', "\<C-g>", 'input_command_line')

" Prefix
nnoremap [denite] <nop>
nmap <leader>u [denite]

" ファイル一覧
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>

" 最近開いたファイル一覧
nnoremap <silent> [denite]h :<C-u>Denite file_mru<CR>

" yank一覧
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>

" ファイル内の行検索
nnoremap <silent> [denite]l :<C-u>Denite line<CR>

" grep
nnoremap <silent> [denite]r :<C-u>DeniteCursorWord grep<CR>

" バッファ一覧
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>

" Ripgrep command on file_rec source.
call denite#custom#var('file_rec', 'command',
    \ ['rg', '--hidden', '--glob', '!.git/*', '--files'])

" Ripgrep command on grep source.
" 参考: https://github.com/BurntSushi/ripgrep/issues/73
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading', '--hidden', '--glob', '!.git/*', '--color', 'never'])

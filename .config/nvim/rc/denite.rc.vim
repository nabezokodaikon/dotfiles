"--------------------------------
" denite.nvim 設定 
"--------------------------------
" キーマッピング
call denite#custom#map('insert', "\<C-n>", 'move_to_next_line')
call denite#custom#map('insert', "\<C-p>", 'move_to_prev_line')
call denite#custom#map('insert', "\<C-g>", 'input_command_line')

" 最近開いたファイル一覧
nnoremap <silent> <leader>uh :<C-u>Denite file_mru<CR>

" yank一覧
nnoremap <silent> <leader>uy :<C-u>Denite neoyank<CR>

" ファイル内の行検索
nnoremap <silent> <leader>ul :<C-u>Denite line<CR>

" grep
nnoremap <silent> <leader>ur :<C-u>Denite grep<CR>

" バッファ一覧
nnoremap <silent> <leader>ub :<C-u>Denite buffer<CR>

" Ripgrep command on file_rec source.
" call denite#custom#var('file_rec', 'command',
    " \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('file_rec', 'command',
    \ ['rg', '--hidden', '--glob', '!.git/*', '--files'])
" call denite#custom#var('file_rec', 'command', ['rg'])
" call denite#custom#var('file_rec', 'recursive_opts', [])
" call denite#custom#var('file_rec', 'final_opts', [])
" call denite#custom#var('file_rec', 'separator', ['--'])
" call denite#custom#var('file_rec', 'default_opts',
    " \ ['--hidden', '--glob', '!.git/*', '--files'])

" Ripgrep command on grep source.
" 参考: https://github.com/BurntSushi/ripgrep/issues/73
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading', '--hidden', '--glob', '!.git/*'])

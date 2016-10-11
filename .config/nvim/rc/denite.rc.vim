"--------------------------------
" denite.nvim 設定 
"--------------------------------
" キーマッピング
call denite#custom#map('_', "\<C-j>", 'quit')
call denite#custom#map('_', "\<C-n>", 'move_to_next_line')
call denite#custom#map('_', "\<C-p>", 'move_to_prev_line')
call denite#custom#map('_', "\<C-g>", 'input_command_line')

" 最近開いたファイル一覧
nnoremap <silent> <space>uh :<C-u>Denite file_mru<CR>

" yank一覧
nnoremap <silent> <space>uy :<C-u>Denite neoyank<CR>

" ファイル内の行検索
nnoremap <silent> <space>ul :<C-u>Denite line<CR>

" grep
nnoremap <silent> <space>ur :<C-u>Denite grep<CR>

" コマンドカスタマイズ
" Ripgrep command on grep source.
" 参考: https://github.com/BurntSushi/ripgrep/issues/73
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading', '--hidden', '--glob', '!.git/*'])

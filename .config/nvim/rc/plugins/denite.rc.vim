"--------------------------------
" denite.nvim configurations.
"--------------------------------
" Key mapping.
call denite#custom#map('insert', "\<C-n>", 'move_to_next_line')
call denite#custom#map('insert', "\<C-p>", 'move_to_prev_line')
call denite#custom#map('insert', "\<C-g>", 'input_command_line')

" Ripgrep command on file_rec source.
call denite#custom#var('file_rec', 'command',
    \ ['rg', '--hidden', '--glob', '!.git/*', '--files'])

" Ripgrep command on grep source.
" Reference 
" https://github.com/BurntSushi/ripgrep/issues/73
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading', '--hidden', '--glob', '!.git/*', '--color', 'never'])

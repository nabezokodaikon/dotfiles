"--------------------------------
" denite.nvim lazy configurations
"--------------------------------
" Key mapping.
call denite#custom#map('insert', "\<C-n>", 'move_to_next_line')
call denite#custom#map('insert', "\<C-p>", 'move_to_prev_line')

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

" Because changing focus, if the vim-gista-unite's narrow action.
call unite#custom#profile('default', 'context', {
            \   'start_insert': 0,
            \   'prompt_direction': 'top',
            \   'split' : 0
            \})

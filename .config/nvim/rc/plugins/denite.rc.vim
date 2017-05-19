"--------------------------------
" denite.nvim lazy configurations
"--------------------------------
" Key mapping.
call denite#custom#map(
            \ 'insert',
            \ '<C-n>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \ )
call denite#custom#map(
            \ 'insert',
            \ '<C-p>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \ )

" Command option.
call denite#custom#option('_', 'winheight', 10)
call denite#custom#option('_', 'highlight_mode_insert', 'Search')

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

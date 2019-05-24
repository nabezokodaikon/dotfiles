"--------------------------------
" denite.nvim
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
call denite#custom#option('_', 'winheight', 16)
call denite#custom#option('_', 'highlight_mode_insert', 'Search')
call denite#custom#option('_', 'previewheight', 100)

" Change matches to perfect matching.
call denite#custom#source('_', 'matchers',
    \ ['matcher/substring'])

call denite#custom#source('buffer', 'matchers',
    \ ['matcher/fuzzy', 'matcher/project_files'])

" Ripgrep command on file/rec source.
call denite#custom#var('file/rec', 'command',
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

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
endfunction

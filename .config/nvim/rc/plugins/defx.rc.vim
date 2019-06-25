"--------------------------------
" defx.nvim
"--------------------------------
autocmd FileType defx call s:defx_my_settings()

function! s:defx_my_settings() abort

  nnoremap <silent><buffer><expr> <CR>
    \ defx#do_action('open')

  nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')

  nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')

  nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')

  nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_or_close_tree')

  nnoremap <silent><buffer><expr> <C-n>
    \ defx#do_action('new_multiple_files')

  nnoremap <silent><buffer><expr> C
    \ defx#do_action('toggle_columns',
    \                'mark:filename:type:size:time')

  nnoremap <silent><buffer><expr> D
    \ defx#do_action('remove')

  nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')

  nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')

  nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')

  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')

  nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])

  nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')

  nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'

  nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'

  nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')

  nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
  
endfunction

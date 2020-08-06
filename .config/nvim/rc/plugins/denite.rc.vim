"--------------------------------
" denite.nvim
"--------------------------------
" Command option.
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'prompt': '> ',
    \ 'winrow': 1,
    \ 'winheight': 16
    \ })

" Sorters
call denite#custom#source('file/rec', 'sorters',
    \ ['sorter/rank'])

" Ripgrep command on file/rec source.
call denite#custom#var('file/rec', 'command',
    \ ['rg', '--hidden', '--glob', '!.git/*', '--files'])

" Matchers
call denite#custom#source('file_mru', 'matchers',
    \ ['matcher/fuzzy', 'matcher/project_files'])

" Ripgrep command on grep source.
" Reference 
" https://github.com/BurntSushi/ripgrep/issues/73
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'default_opts',
    \ ['--vimgrep', '--no-heading', '--hidden', '--glob', '!.git/*'])

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-w>n
        \ denite#do_map('nop')
    nnoremap <silent><buffer><expr> <C-w>N
        \ denite#do_map('nop')
    nnoremap <silent><buffer><expr> <C-w>s
        \ denite#do_map('nop')
    nnoremap <silent><buffer><expr> <C-w>S
        \ denite#do_map('nop')
    nnoremap <silent><buffer><expr> <C-w>k
        \ denite#do_map('nop')
    nnoremap <silent><buffer><expr> gn
        \ denite#do_map('nop')
    nnoremap <silent><buffer><expr> gt
        \ denite#do_map('nop')
    nnoremap <silent><buffer><expr> gT
        \ denite#do_map('nop')
endfunction

" Define filter mappings
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    inoremap <silent><buffer><expr> <C-c>
        \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-c>
        \ denite#do_map('quit')
    imap <silent><buffer> <Esc>
        \ <Plug>(denite_filter_quit)
    imap <silent><buffer> jj 
        \ <Plug>(denite_filter_quit)
endfunction

" Floating windows
augroup denite-transparent-windows
  autocmd!
  autocmd FileType denite set winblend=15
  autocmd FileType denite-filter set winblend=15
augroup END

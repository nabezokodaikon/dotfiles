call ddu#custom#patch_global({
    \ 'ui': 'std',
    \ })

call ddu#custom#patch_global({
    \   'sourceOptions': {
    \     '_': {
    \       'matchers': ['matcher_fzf'],
    \     },
    \   }
    \ })

autocmd FileType ddu-std call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
  \ <Cmd>call ddu#ui#std#do_map('doAction', {'name' : 'default'})<CR>
  nnoremap <buffer><silent> i
  \ <Cmd>call ddu#ui#std#do_map('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#std#do_map('quit')<CR>
endfunction

autocmd FileType ddu-std-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
  \ <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>
  \ <Cmd>close<CR>
endfunction

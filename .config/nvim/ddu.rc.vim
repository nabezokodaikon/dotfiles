lua << EOF
vim.call('ddu#custom#patch_global',
        'ui', 'std')
vim.call('ddu#custom#patch_global',
        'sourceOptions', {_ = {matchers = {'matcher_fzf'}}})
vim.call('ddu#custom#patch_global',
        'sourceParams', {rg = {args = {'--column', '--no-heading', '--color', 'never', '--hidden', '--glob', '!.git/*'}}})
vim.call('ddu#custom#patch_global',
        'uiParams', {std = {split = 'floating', winHeight = 16, winRow = vim.o.lines, winWidth = vim.o.columns}})
EOF

autocmd FileType ddu-std call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
  \ <Cmd>call ddu#ui#std#do_action('itemAction')<CR>
  nnoremap <buffer><silent> i
  \ <Cmd>call ddu#ui#std#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#std#do_action('quit')<CR>
endfunction

autocmd FileType ddu-std-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
  \ <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>
  \ <Cmd>close<CR>
endfunction

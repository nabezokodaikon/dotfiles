"--------------------------------	
" vim-lsp	
"--------------------------------	
if executable('rls')
    augroup LspRust 
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
    augroup END
endif

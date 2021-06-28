"--------------------------------
" File type configurations
"--------------------------------
augroup fileTypeRelation
    autocmd!
    autocmd BufRead,BufNewFile *.hxp set filetype=haxe
    autocmd BufRead,BufNewFile *.sbt set filetype=scala
    autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
    autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
    autocmd BufNewFile,BufRead *.gql set filetype=graphql
    autocmd BufNewFile,BufRead *.graphql set filetype=graphql
    autocmd BufNewFile,BufRead *.vtl set filetype=velocity
augroup END

augroup fileTypeIndent
    autocmd!
    autocmd BufRead,BufNewFile *.* setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.css setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile dockerfile setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.html setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.hs setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.hx setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.hxp setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile gitcommit setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.graphql setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.graphqls setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.gql setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.js setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.json setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.jsx setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.markdown setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.md setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.py setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.rs setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.sbt setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.scala setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.ts setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.tsx setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.vue setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.xml setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.yml setlocal tabstop=2 shiftwidth=2
augroup END

augroup fileTypeDeclaration
    autocmd!
    autocmd BufRead,BufNewFile *.hs nnoremap <silent> <Leader>d :<C-u>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.hx nnoremap <silent> <Leader>d :<C-u>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.hxp nnoremap <silent> <Leader>d :<C-u>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.js nnoremap <silent> <Leader>d :<C-u>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.jsx nnoremap <silent> <Leader>d :<C-u>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.py nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.rs nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.scala nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.ts nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.tsx nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
augroup END

augroup fileTypeHover
    autocmd!
    autocmd BufRead,BufNewFile *.py nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
    autocmd BufRead,BufNewFile *.rs nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
    autocmd BufRead,BufNewFile *.scala nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
    autocmd BufRead,BufNewFile *.ts nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
    autocmd BufRead,BufNewFile *.tsx nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
augroup END

augroup fileTypReferences
    autocmd!
    autocmd BufRead,BufNewFile *.py nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
    autocmd BufRead,BufNewFile *.rs nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
    autocmd BufRead,BufNewFile *.scala nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
    autocmd BufRead,BufNewFile *.ts nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
    autocmd BufRead,BufNewFile *.tsx nnoremap <silent> <Leader>r <cmd>lua vim.lsp.buf.references()<CR>
augroup END


" Git commit message completion settings
"--------------------------------
function! s:enable_completion()
lua << EOF
    package.path = package.path .. "/lua/lsp.lua"
    require'lsp.lua'.enable_completion()
EOF
endfunction

function! s:disable_completion()
lua << EOF
    package.path = package.path .. "/lua/lsp.lua"
    require'lsp.lua'.disable_completion()
EOF
endfunction

autocmd WinEnter,BufEnter *
    \ if expand("%") != "COMMIT_EDITMSG"
    \| call s:enable_completion() | else
    \| call s:disable_completion() | endif


" denite-filter commit message completion settings
"--------------------------------
function! s:enable_completion()
lua << EOF
    package.path = package.path .. "/lua/lsp.lua"
    require'lsp.lua'.enable_completion()
EOF
endfunction

function! s:disable_completion()
lua << EOF
    package.path = package.path .. "/lua/lsp.lua"
    require'lsp.lua'.disable_completion()
EOF
endfunction

autocmd WinEnter,BufEnter *
    \ if &ft != "denite-filter"
    \| call s:enable_completion() | else
    \| call s:disable_completion() | endif

"--------------------------------
" File type configurations
"--------------------------------
augroup fileTypeRelation
    autocmd!
    autocmd BufRead,BufNewFile *.hxp set filetype=haxe
    autocmd BufRead,BufNewFile *.sbt set filetype=scala
augroup END

augroup fileTypeIndent
    autocmd!
    autocmd BufRead,BufNewFile *.* setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.css setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.html setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.hs setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.hx setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.hxp setlocal tabstop=2 shiftwidth=2
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
    autocmd BufRead,BufNewFile *.yaml setlocal tabstop=2 shiftwidth=2
augroup END

augroup fileTypeDictionary
    autocmd!
    autocmd BufRead,BufNewFile *.hs setlocal dictionary=~/.config/nvim/dict/haskell.dict
augroup END

augroup fileTypeDeclaration
    autocmd!
    autocmd BufRead,BufNewFile *.hs nnoremap <silent> <Leader>d :<C-u>DeniteCursorWord tag<CR>
    autocmd BufRead,BufNewFile *.hx nnoremap <silent> <Leader>d :call LanguageClient#textDocument_definition()<CR>
    autocmd BufRead,BufNewFile *.hxp nnoremap <silent> <Leader>d :call LanguageClient#textDocument_definition()<CR>
    autocmd BufRead,BufNewFile *.js nnoremap <silent> <Leader>d :<C-u>DeniteCursorWord tag<CR>
    autocmd BufRead,BufNewFile *.jsx nnoremap <silent> <Leader>d :<C-u>DeniteCursorWord tag<CR>
    autocmd BufRead,BufNewFile *.py nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.rs nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.scala nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.ts nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
    autocmd BufRead,BufNewFile *.tsx nnoremap <silent> <Leader>d <cmd>lua vim.lsp.buf.definition()<CR>
augroup END

augroup fileTypeVariableRename
    autocmd!
    autocmd BufRead,BufNewFile *.hx nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
    autocmd BufRead,BufNewFile *.hxp nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
    autocmd BufRead,BufNewFile *.rs nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
    autocmd BufRead,BufNewFile *.scala nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
    autocmd BufRead,BufNewFile *.ts nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
    autocmd BufRead,BufNewFile *.tsx nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
augroup END

augroup fileTypeHover
    autocmd!
    autocmd BufRead,BufNewFile *.py nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
    autocmd BufRead,BufNewFile *.rs nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
    autocmd BufRead,BufNewFile *.scala nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
    autocmd BufRead,BufNewFile *.ts nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
    autocmd BufRead,BufNewFile *.tsx nnoremap <silent> <Leader>k <cmd>lua vim.lsp.buf.hover()<CR>
augroup END

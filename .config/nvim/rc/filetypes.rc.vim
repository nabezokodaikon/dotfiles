"--------------------------------
" File type configurations
"--------------------------------
augroup fileTypeRelation
    autocmd!
    autocmd BufRead,BufNewFile *.sbt set filetype=scala
augroup END

augroup fileTypeIndent
    autocmd!
    autocmd BufRead,BufNewFile *.* setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.css setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.html setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.hs setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.hx setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.js setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.json setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.jsx setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.markdown setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.md setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.rs setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.sbt setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.scala setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.ts setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.tsx setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.xml setlocal tabstop=2 shiftwidth=2
augroup END

augroup fileTypeDictionary
    autocmd!
    autocmd BufRead,BufNewFile *.hs setlocal dictionary=~/.config/nvim/dict/haskell.dict
    autocmd BufRead,BufNewFile *.js setlocal dictionary=~/.config/nvim/dict/javascript.dict
    autocmd BufRead,BufNewFile *.jsx setlocal dictionary=~/.config/nvim/dict/javascript.dict
    autocmd BufRead,BufNewFile *.rs setlocal dictionary=~/.config/nvim/dict/rust.dict
augroup END

augroup fileTypeDeclaration
    autocmd!
    autocmd BufRead,BufNewFile *.hs nnoremap <silent> <Leader>d :<C-u>DeniteCursorWord tag<CR>
    autocmd BufRead,BufNewFile *.hx nnoremap <silent> <Leader>d :call LanguageClient#textDocument_definition()<CR>
    autocmd BufRead,BufNewFile *.js nnoremap <silent> <Leader>d :<C-u>DeniteCursorWord tag<CR>
    autocmd BufRead,BufNewFile *.jsx nnoremap <silent> <Leader>d :<C-u>DeniteCursorWord tag<CR>
augroup END

augroup fileTypeVariableRename
    autocmd!
    autocmd BufRead,BufNewFile *.hx nnoremap <F2> :call LanguageClient#textDocument_rename()<CR>
augroup END

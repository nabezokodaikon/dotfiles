"--------------------------------
" File type configurations
"--------------------------------
augroup fileTypeIndent
    autocmd!
    autocmd BufRead,BufNewFile *.* setlocal tabstop=4 shiftwidth=4
    autocmd BufRead,BufNewFile *.css setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.html setlocal tabstop=2 shiftwidth=2
    autocmd BufRead,BufNewFile *.hs setlocal tabstop=4 shiftwidth=4
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
    autocmd BufRead,BufNewFile *.sbt setlocal dictionary=~/.config/nvim/dict/scala.dict
    autocmd BufRead,BufNewFile *.scala setlocal dictionary=~/.config/nvim/dict/scala.dict
augroup END

augroup fileTypeDeclaration
    autocmd!
    autocmd BufRead,BufNewFile *.* nnoremap <silent> <Leader>d :<C-u>DeniteCursorWord tag<CR>
    autocmd BufRead,BufNewFile *.rs nnoremap <silent> <Leader>d :<C-u>call LanguageClient#textDocument_definition()<CR>
    autocmd BufRead,BufNewFile *.scala nnoremap <silent> <Leader>d :<C-u>EnDeclaration<CR>
    autocmd BufRead,BufNewFile *.ts nnoremap <silent> <Leader>d :<C-u>TSDef<CR>
    autocmd BufRead,BufNewFile *.tsx nnoremap <silent> <Leader>d :<C-u>TSDef<CR>
augroup END

augroup fileTypeVariableRename
    autocmd!
    autocmd BufRead,BufNewFile *.rs nnoremap <silent> <F2> :<C-u>call LanguageClient#textDocument_rename()<CR>
augroup END

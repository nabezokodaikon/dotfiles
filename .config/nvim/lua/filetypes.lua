--------------------------------
-- File type settings
--------------------------------
vim.cmd [[
  augroup fileTypeRelation
      autocmd!
      autocmd BufNewFile,BufRead *.sbt set filetype=scala
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
      autocmd BufRead,BufNewFile gitcommit setlocal tabstop=2 shiftwidth=2
      autocmd BufRead,BufNewFile *.graphql setlocal tabstop=2 shiftwidth=2
      autocmd BufRead,BufNewFile *.graphqls setlocal tabstop=2 shiftwidth=2
      autocmd BufRead,BufNewFile *.gql setlocal tabstop=2 shiftwidth=2
      autocmd BufRead,BufNewFile *.html setlocal tabstop=2 shiftwidth=2
      autocmd BufRead,BufNewFile *.hs setlocal tabstop=4 shiftwidth=4
      autocmd BufRead,BufNewFile *.js setlocal tabstop=2 shiftwidth=2
      autocmd BufRead,BufNewFile *.json setlocal tabstop=2 shiftwidth=2
      autocmd BufRead,BufNewFile *.jsx setlocal tabstop=2 shiftwidth=2
      autocmd BufRead,BufNewFile *.lua setlocal tabstop=2 shiftwidth=2
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
]]

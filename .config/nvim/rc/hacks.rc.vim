"--------------------------------
" Hacks
"--------------------------------

" Auto mkdir
" Reference
" http://vim-jp.org/vim-users-jp/2011/02/20/Hack-202.html
"--------------------------------
augroup vimrc-auto-mkdir
    autocmd!
    autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
    function! s:auto_mkdir(dir, force)
        if !isdirectory(a:dir) && (a:force || input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
            call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
        endif
    endfunction
augroup END


" Transparent backg
" Reference
" http://vim-jp.org/vimdoc-ja/syntax.html#:highlight
" http://qiita.com/s_of_p/items/87a9d787ff5506edab8e
" https://github.com/miyakogi/seiya.vim
"--------------------------------
augroup vimrc-apply-transparent
    autocmd!
    function! s:apply_transparent(group)
        execute 'highlight ' . a:group . ' ctermbg=None'
    endfunction
    function! s:apply_transparent_all()
        call s:apply_transparent('LineNr')
        call s:apply_transparent('NonText')
        call s:apply_transparent('Normal')
        call s:apply_transparent('SignColumn')
        call s:apply_transparent('VertSplit')
    endfunction
    autocmd VimEnter,ColorScheme * call s:apply_transparent_all()
augroup END

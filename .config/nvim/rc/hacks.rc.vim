"--------------------------------
" Hacks
"--------------------------------

" Auto mkdir
" Reference
" http://vim-jp.org/vim-users-jp/2011/02/20/Hack-202.html
"--------------------------------
augroup vimrc-auto-mkdir
    autocmd!
    function! s:auto_mkdir(dir, force)
        if !isdirectory(a:dir) && (a:force || input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
            call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
        endif
    endfunction
    autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
augroup END


" Command-line window.
"--------------------------------
" Toggle display by <esc><esc>.
" nnoremap <esc><esc> <Nop>
" nnoremap <esc><esc> q:
" xnoremap <esc><esc> <Nop>
" xnoremap <esc><esc> q:
" augroup vimrc-cmdwin-toggle
    " autocmd!
    " function! s:vimrc_cmdwin_enter()
        " nnoremap <esc><esc> <Nop>
        " nnoremap <esc><esc> :q<CR>
        " xnoremap <esc><esc> <Nop>
        " xnoremap <esc><esc> :q<CR>
    " endfunction
    " function! s:vimrc_cmdwin_leave()
        " nnoremap <esc><esc> <Nop>
        " nnoremap <esc><esc> q:
        " xnoremap <esc><esc> <Nop>
        " xnoremap <esc><esc> q:
    " endfunction
    " autocmd CmdwinEnter * call s:vimrc_cmdwin_enter()
    " autocmd CmdwinLeave * call s:vimrc_cmdwin_leave()
" augroup END

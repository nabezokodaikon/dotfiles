"--------------------------------
" Hacks
"--------------------------------

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


" Customize tabline.
"--------------------------------
set tabline=%!MakeTabLine()

function! MakeTabLine()
    let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
    let sep = '|'  
    let tabpages = join(titles, sep) . sep . '%#TabLineFill#%T'
    let info = fnamemodify(getcwd(), ":~") . ' '
    return tabpages . '%=' . info  
endfunction

function! s:tabpage_label(n)

    " t:title と言う変数があったらそれを使う。
    let title = gettabvar(a:n, 'title')
    if title !=# ''
        return title
    endif

    " タブページ内のバッファのリストを取得する。
    let bufnrs = tabpagebuflist(a:n)

    " バッファ名を設定する。
    let bufnr = bufnrs[tabpagewinnr(a:n) - 1]
    let bufname = bufname(bufnr)
    if bufname == ''
        let bufname = '[No Name]'
    else
        let bufname = fnamemodify(bufname, ":t")
    endif

    " バッファが複数存在する場合、バッファ数を表示する。
    let no = len(bufnrs)
    if no is 1
        let no = ''
    endif
    
    " タブページ内に変更ありのバッファが存在する場合、'+' を表示する。
    let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '+' : ''
    let sp = (no . mod) ==# '' ? '' : ' '  " 隙間空ける

    " ハイライトを切り替え。
    let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'

    return hi . ' ' . no . mod . sp . bufname . ' ' . '%T%#TabLineFill#'
endfunction

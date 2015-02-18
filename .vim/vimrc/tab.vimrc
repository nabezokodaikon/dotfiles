"--------------------------------
" tab 設定
"--------------------------------
" tmux のタブ(ウィンドウ操作に合わせる)
" 新しいタブを開く
nnoremap gc <Nop>
nnoremap gc :tabnew<CR>

" 現在のタブを閉じる
nnoremap gd <Nop>
nnoremap gd :tabclose<CR>

" vim-submode
" 次のタブへ移動する操作を押しっぱなしでできるようにする。 
nnoremap gn <Nop>
nnoremap gp <Nop>
call submode#enter_with('changetab', 'n', '', 'gn', 'gt')
call submode#map('changetab', 'n', '', 'n', 'gt')

" 前のタブへ移動する操作を押しっぱなしでできるようにする。
call submode#enter_with('changetab', 'n', '', 'gp', 'gT')
call submode#map('changetab', 'n', '', 'p', 'gT')

" unite.vim
nnoremap <silent> [unite]<space> :<C-u>Unite tab<CR>

" タブページを常に表示
set showtabline=2

" タブラインをカスタマイズ
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


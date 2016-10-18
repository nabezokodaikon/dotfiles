"--------------------------------
" プラグイン設定 
"--------------------------------

" vim-fugitive
"--------------------------------
" ステータスラインの書式にgitの情報を表示する。
set statusline=%F\ [%Y][%{&fileencoding}]%=%{fugitive#statusline()}\ %l/%L\ %c\ %P


" vim-gista
"--------------------------------
let g:gista#client#default_username = 'nabezokodaikon'


" nerdcommenter
"--------------------------------
" コメントの間にスペースを開ける
let NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle


" seiya.vim
"--------------------------------
" 背景の透過を有効化する。
let g:seiya_auto_enable = 1


" vim-easymotion
"--------------------------------
" デフォルトのキーマッピングを無効化する。
let g:EasyMotion_do_mapping = 0
" 大文字、小文字を区別しない。
let g:EasyMotion_smartcase = 1
" 2文字のキーワード検索のみを有効化する。
nmap <Leader>s <Plug>(easymotion-s2)


" jellybeans.vim
"--------------------------------
let g:jellybeans_overrides = {
\   'CursorLine': {
\       '256ctermbg': '235',
\       'attr': 'bold'
\   },
\   'Visual': {
\       '256ctermbg': '238',
\       'attr': 'bold'
\   },
\   'PmenuSel': {
\       'attr': 'bold'
\   }
\}

colorscheme jellybeans


" translategoogle.vim
"--------------------------------
function! Translate_En2Ja()
    let tmp = @@
    silent normal = gvy
    let selected = @@
    let ret = translategoogle#command(join([
                \   '--sl=en',
                \   '--tl=ja',
                \   selected
                \ ], ' '))
    echo ret
endfunction

function! Translate_Ja2En()
    let tmp = @@
    silent normal = gvy
    let selected = @@
    let ret = translategoogle#command(join([
                \   '--sl=ja',
                \   '--tl=en',
                \   selected
                \ ], ' '))
    echo ret
endfunction

vnoremap <space>tej :<C-u>call Translate_En2Ja()<CR>
vnoremap <space>tje :<C-u>call Translate_Ja2En()<CR>

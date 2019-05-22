"--------------------------------
" Plugins configurations
"--------------------------------

"--------------------------------
" emmet-vim
"--------------------------------
let g:user_emmet_leader_key='<C-e>'


"--------------------------------
" nerdcommenter
"--------------------------------
nnoremap co <Nop>
vnoremap co <Nop>
nmap co <Plug>NERDCommenterToggle
vmap co <Plug>NERDCommenterToggle


"--------------------------------
" vim-easymotion
"--------------------------------
" デフォルトのキーマッピングを無効化。
let g:EasyMotion_do_mapping = 0
" 検索後、Enterでカーソル位置に一番近いマッチした箇所に移動する。
let g:EasyMotion_enter_jump_first = 1
" キーワードの入力を2文字まで受け付ける。
nmap <Leader>m <Plug>(easymotion-overwin-f2)


"--------------------------------
" denite.nvim
"--------------------------------
" ファイル一覧
nnoremap <silent> <Leader>f :<C-u>Denite file/rec -start-filter<CR>
" ファイル表示履歴
nnoremap <silent> <Leader>h :<C-u>Denite file_mru<CR>
" yank
nnoremap <silent> <Leader>y :<C-u>Denite neoyank<CR>
" ファイル内の行検索
nnoremap <silent> <Leader>l :<C-u>Denite line -start-filter<CR>
" grep for empty word
nnoremap <silent> <Leader>gg :<C-u>Denite grep -start-filter<CR>
" grep for cursor word
nnoremap <silent> <Leader>gw :<C-u>DeniteCursorWord grep -start-filter<CR>
" buffe
nnoremap <silent> <Leader>b :<C-u>Denite buffer<CR>
" File type
nnoremap <silent> <Leader>e :<C-u>Denite filetype -start-filter<CR>
" outline
nnoremap <silent> <Leader>o :<C-u>Denite outline -start-filter<CR>
" Move to next/previous line of denite's buffer
nnoremap <C-n> <Nop>
nnoremap <C-p> <Nop>
nnoremap <silent> <C-n> :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
nnoremap <silent> <C-p> :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>


"--------------------------------
" defx.nvim
"--------------------------------
nnoremap F <Nop>
nnoremap <silent> F :<C-u>Defx -resume<CR>


"--------------------------------
" vim-submode configurations
"--------------------------------
" Window resize.
call submode#enter_with('window-resize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('window-resize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('window-resize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('window-resize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('window-resize', 'n', '', '>', '<C-w>>')
call submode#map('window-resize', 'n', '', '<', '<C-w><')
call submode#map('window-resize', 'n', '', '+', '<C-w>+')
call submode#map('window-resize', 'n', '', '-', '<C-w>-')

" Tab change.
call submode#enter_with('tab-next', 'n', '', 'gt', 'gt')
call submode#map('tab-next', 'n', '', 't', 'gt')
call submode#enter_with('tab-preview', 'n', '', 'gT', 'gT')
call submode#map('tab-preview', 'n', '', 'T', 'gT')


"--------------------------------
" nerdcommenter configurations
"--------------------------------
" コメントの間にスペースを開ける
let NERDSpaceDelims = 1


"--------------------------------
" vim-easymotion configurations
"--------------------------------
" 大文字、小文字を区別しない。
let g:EasyMotion_smartcase = 1


"--------------------------------
" Translate script
"--------------------------------
vnoremap <silent> <Leader>t :<C-u>JaEnTranslate<CR>

"--------------------------------
" Plugins configurations
"--------------------------------

"--------------------------------
" nerdcommenter
"--------------------------------
" コメントの間にスペースを開ける
let NERDSpaceDelims = 1
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
" 大文字、小文字を区別しない。
let g:EasyMotion_smartcase = 1
" キーワードの入力を2文字まで受け付ける。
nmap <Leader>m <Plug>(easymotion-overwin-f2)


"--------------------------------
" telescope.nvim
"--------------------------------
nnoremap <silent> <Leader>f :<C-u>
    \ Telescope find_files find_command=rg,--hidden,--glob,!.git/*,--files<CR>
nnoremap <silent> <Leader>gg :<C-u>Telescope live_grep<CR>
nnoremap <silent> <Leader>b :<C-u>Telescope buffers<CR>
nnoremap <silent> <Leader>t :<C-u>Telescope filetypes<CR>
nnoremap <silent> <Leader>h :<C-u>Telescope oldfiles cwd_only=v:true<CR>


"--------------------------------
" defx.nvim
"--------------------------------
nnoremap F <Nop>
nnoremap <silent> F :<C-u>NvimTreeToggle<CR>


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
" Translate script
"--------------------------------
vnoremap <silent> <Leader>t :<C-u>TranslateJa2En<CR>
vnoremap <silent> <Leader>j :<C-u>TranslateEn2Ja<CR>


"--------------------------------
" colorscheme
"--------------------------------
colorscheme gruvbox

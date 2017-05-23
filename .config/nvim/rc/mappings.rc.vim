"--------------------------------
" Key mapping configurations
"--------------------------------

" Unmappings
"--------------------------------
" Disable the Ex mode.
nnoremap Q <Nop>
nnoremap gQ <Nop>


" General
"--------------------------------
" Switch to the normal mode.
inoremap jj <ESC>

" Change of the leader key. 
nnoremap <Space> <Nop>
let mapleader = "\<Space>"


" split
"--------------------------------
" Unmappings
nnoremap <C-w>s <Nop>
nnoremap <C-w>S <Nop>
nnoremap <C-w><C-s> <Nop>
nnoremap <C-w><C-S> <Nop>
nnoremap <C-w>v <Nop>
nnoremap <C-w>V <Nop>
nnoremap <C-w><C-v> <Nop>
nnoremap <C-w><C-V> <Nop>
nnoremap <C-w>n <Nop>
nnoremap <C-w>N <Nop>
nnoremap <C-w><C-n> <Nop>
nnoremap <C-w><C-N> <Nop>

" Current split
nnoremap <silent> <C-w>s :vsplit<CR>
nnoremap <silent> <C-w>S :split<CR>

" New split
nnoremap <silent> <C-w>n :vnew<CR>
nnoremap <silent> <C-w>N :new<CR>


" tab
"--------------------------------
" Unmappings
nnoremap gn <Nop>
nnoremap gc <Nop>

nnoremap gn :tabnew<CR>
nnoremap gc :tabclose<CR>


" tags 
"--------------------------------
" Unmappings
nnoremap <C-t> <Nop>
nnoremap t <Nop>

" 飛ぶ
nnoremap tt g<C-]>
" 進む
nnoremap tj :<C-u>tag<CR>
" 戻る
nnoremap tk :<C-u>pop<CR>
" 履歴一覧
nnoremap tl :<C-u>tags<CR>


" emmet-vim
"--------------------------------
nnoremap <C-e> <Nop>
let g:user_emmet_leader_key='<C-e>'


" nerdcommenter
"--------------------------------
nnoremap co <Nop>
vnoremap co <Nop>
nmap co <Plug>NERDCommenterToggle
vmap co <Plug>NERDCommenterToggle


" vim-easymotion
"--------------------------------
" デフォルトのキーマッピングを無効化。
let g:EasyMotion_do_mapping = 0
" 検索後、Enterでカーソル位置に一番近いマッチした箇所に移動する。
let g:EasyMotion_enter_jump_first = 1
" キーワードの入力を2文字まで受け付ける。
nmap <Leader>m <Plug>(easymotion-overwin-f2)


" denite.nvim
"--------------------------------
" ファイル一覧
nnoremap <silent> <Leader>f :<C-u>Denite file_rec<CR>
" ファイル表示履歴
nnoremap <silent> <Leader>h :<C-u>Denite file_mru<CR>
" yank
nnoremap <silent> <Leader>y :<C-u>Denite neoyank<CR>
" ファイル内の行検索
nnoremap <silent> <Leader>l :<C-u>Denite line<CR>
" grep
nnoremap <silent> <Leader>g :<C-u>DeniteCursorWord grep<CR>
" buffer
nnoremap <silent> <Leader>b :<C-u>Denite buffer<CR>
" gista
nnoremap <silent> <Leader>s :<C-u>Denite unite:gista<CR>
" File type
nnoremap <silent> <Leader>e :<C-u>Denite filetype<CR>
" tag
nnoremap <silent> <Leader>d :<C-u>DeniteCursorWord tag<CR>
" Move to next/previous line of denite's buffer
nnoremap <C-n> <Nop>
nnoremap <C-p> <Nop>
nnoremap <silent> <C-n> :<C-u>Denite -resume -select=+1 -immediately<CR>
nnoremap <silent> <C-p> :<C-u>Denite -resume -select=-1 -immediately<CR>


" deoplete.nvim
"--------------------------------
" <C-h>や<BS>を押したときに確実にポップアップを削除する。
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<BS>"

" 補完候補が出ていたら確定、なければ改行する。
inoremap <expr><CR>  pumvisible() ? deoplete#mappings#close_popup() : "<CR>"


" Translate
"--------------------------------
vnoremap <silent> <Leader>t :<C-u>call Translate()<CR>

"--------------------------------
" Key mapping configurations
"--------------------------------
" Switch To the command mode.
inoremap jj <ESC>

" <Leader> を <Space> に変更。
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" Disable the Ex mode.
nnoremap Q <Nop>
nnoremap gQ <Nop>


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
" 2文字のキーワード検索のみを有効化。
nmap <Leader>s <Plug>(easymotion-s2)


" denite.nvim
"--------------------------------
" Prefix
nnoremap [denite] <Nop>
nmap <Leader>u [denite]

" ファイル一覧
nnoremap <silent> [denite]f :<C-u>Denite file_rec<CR>
" ファイル表示履歴
nnoremap <silent> [denite]h :<C-u>Denite file_mru<CR>
" yank
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>
" ファイル内の行検索
nnoremap <silent> [denite]l :<C-u>Denite line<CR>
" grep
nnoremap <silent> [denite]r :<C-u>DeniteCursorWord grep<CR>
" buffer
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
" gista
nnoremap <silent> [denite]s :<C-u>Denite unite:gista<CR>

" タグ一覧
augroup vimrc-denite-tag
    autocmd!
    autocmd BufEnter *
                \   if empty(&buftype)
                \|      nnoremap <buffer> [denite]t :<C-u>DeniteCursorWord unite:tag<CR>
                \|  endif
augroup END


" unite.vim
"--------------------------------
" アウトライン
nnoremap <silent> <Leader>uo :<C-u>Unite outline -start-insert<CR>
" タブ一覧
nnoremap <silent> <Leader>ug :<C-u>Unite tab -no-start-insert<CR>


" deoplete.nvim
"--------------------------------
" <C-h>や<BS>を押したときに確実にポップアップを削除する。
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<BS>"

" 補完候補が出ていたら確定、なければ改行する。
inoremap <expr><CR>  pumvisible() ? deoplete#mappings#close_popup() : "<CR>"

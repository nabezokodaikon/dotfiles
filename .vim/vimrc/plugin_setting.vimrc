"--------------------------------
" プラグイン設定 
"--------------------------------

" The-NERD-tree
"--------------------------------
" ツリーをトグル
nmap <silent> <C-e> :NERDTreeToggle<CR>

" 隠しファイルを表示する
" 0: 隠しファイルを表示しない
" 1: 隠しファイルを表示する
let g:NERDTreeShowHidden = 1


" unite.vim
"--------------------------------
" unite.vim からファイルを開くときに dwm で新しいウィンドウで開くようにする
let s:action = {
      \ 'description' : 'new dwm',
      \ 'is_selectable' : 1,
      \ }
function! s:action.func(candidates)
  for l:candidate in a:candidates
    call unite#util#command_with_restore_cursor('rightbelow split')
    call unite#take_action('open', candidate)
    call DWM_Focus()
  endfor
endfunction
call unite#custom_action('openable', 'dwm_new', s:action)
unlet s:action

" プレフィックスを f にする
nnoremap [unite] <Nop>
nmap     <Leader>f [unite]

" 表示時に The-NEAD-tree を閉じる
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR> :NERDTreeClose<CR>
nnoremap <silent> [unite]f :<C-u>Unite file<CR> :NERDTreeClose<CR>
nnoremap <silent> [unite]l :<C-u>Unite file_mru<CR> :NERDTreeClose<CR>
nnoremap <silent> [unite]o :<C-u>Unite outline<CR> :NEADTreeClose<CR>

" タグ一覧を表示するときに、カーソル下の単語に完全一致するタグのみを検索する
command!
\ -nargs=? PopupTags
\ |Unite -immediately tag:<args>
noremap <silent> [unite]t :<C-u>execute "PopupTags ".expand('<cword>')<CR> :NERDTreeClose<CR>


" nerdcommenter
"--------------------------------
" コメントの間にスペースを開ける
let NERDSpaceDelims = 1
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle


" tagbar
"--------------------------------
" タグバーをトグル
nnoremap <silent> <F8> :TagbarToggle<Cr>

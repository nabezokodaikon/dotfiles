"--------------------------------
" tags 設定 
"--------------------------------
" <C-t> は tmux と被るため無効化
nnoremap <C-t> <Nop>
" タグ操作のプレフィックスを t とする
nnoremap t <Nop>
" 飛ぶ
nnoremap tt g<C-]>
" 進む
nnoremap tj :<C-u>tag<CR>
" 戻る
nnoremap tk :<C-u>pop<CR>
" 履歴一覧
nnoremap tl :<C-u>tags<CR>

" tags ファイル設定
set tags=tags
" ~/dotfiles/tags/ ディレクトリに絶対パスで作成したタグファイルを
" 拡張子'.tags'で作成することで vim 起動時に自動で読み込まれる。
" <例>
" $ ctags -f ~/dotfiles/tags/scala.tags -R /usr/local/github/scala/src
execute ":set tags+=" . join(split(glob("~/dotfiles/tags/*.tags"), "\n"), ",")

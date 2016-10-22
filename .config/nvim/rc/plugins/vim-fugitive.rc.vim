"--------------------------------
" vim-fugitive configurations
"--------------------------------
" ステータスラインの書式にgitの情報を表示する。
set statusline=%F\ [%Y][%{&fileencoding}]%=%{fugitive#statusline()}\ %l/%L\ %c\ %P

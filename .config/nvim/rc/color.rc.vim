"--------------------------------
" 色設定
"--------------------------------
" 256色を有効化。
set t_Co=256

" Color Scheme.
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

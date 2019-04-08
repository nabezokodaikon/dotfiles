"--------------------------------
" Plugins configurations
"--------------------------------

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
" jellybeans.vim configurations
"--------------------------------
let g:jellybeans_overrides = {
\   'background': {
\       'ctermbg': 'none',
\       '256ctermbg': 'none'
\   },
\   'CursorLine': {
\       '256ctermbg': '236'
\   },
\   'CursorColumn': {
\       '256ctermbg': '236'
\   },
\   'Visual': {
\       '256ctermbg': '238'
\   },
\   'PmenuSel': {
\       'attr': 'bold'
\   },
\   'TabLineFill': {
\       'attr': 'bold'
\   },
\   'TabLine': {
\       'attr': 'bold'
\   },
\   'TabLineSel': {
\       'attr': 'bold'
\   },
\   'StatusLine': {
\       'attr': 'bold'
\   },
\   'StatusLineNC': {
\       'attr': 'bold'
\   }
\}

colorscheme jellybeans

"--------------------------------
" split 設定
"--------------------------------
" ウィンドウのサイズ変更を押しっぱなしでできるようにする。
call submode#enter_with('window-resize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('window-resize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('window-resize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('window-resize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('window-resize', 'n', '', '>', '<C-w>>')
call submode#map('window-resize', 'n', '', '<', '<C-w><')
call submode#map('window-resize', 'n', '', '+', '<C-w>+')
call submode#map('window-resize', 'n', '', '-', '<C-w>-')

" 次のウィンドウ選択を押しっぱなしでできるようにする。
call submode#enter_with('window-resize', 'n', '', '<C-w>w', '<C-w>w')
call submode#map('window-resize', 'n', '', 'w', '<C-w>w')

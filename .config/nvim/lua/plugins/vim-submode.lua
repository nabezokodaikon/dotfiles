vim.cmd [[
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
]]

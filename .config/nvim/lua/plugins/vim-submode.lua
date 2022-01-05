-- Window resize.
vim.call('submode#enter_with', 'window-resize', 'n', '', '<C-w>>', '<C-w>>')
vim.call('submode#enter_with', 'window-resize', 'n', '', '<C-w><', '<C-w><')
vim.call('submode#enter_with', 'window-resize', 'n', '', '<C-w>+', '<C-w>+')
vim.call('submode#enter_with', 'window-resize', 'n', '', '<C-w>-', '<C-w>-')
vim.call('submode#map', 'window-resize', 'n', '', '>', '<C-w>>')
vim.call('submode#map', 'window-resize', 'n', '', '<', '<C-w><')
vim.call('submode#map', 'window-resize', 'n', '', '+', '<C-w>+')
vim.call('submode#map', 'window-resize', 'n', '', '-', '<C-w>-')

-- Tab change.
vim.call('submode#enter_with', 'tab-next', 'n', '', 'gt', 'gt')
vim.call('submode#map', 'tab-next', 'n', '', 't', 'gt')
vim.call('submode#enter_with', 'tab-preview', 'n', '', 'gT', 'gT')
vim.call('submode#map', 'tab-preview', 'n', '', 'T', 'gT')

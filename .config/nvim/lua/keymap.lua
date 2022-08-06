--------------------------------
-- Key mappings
--------------------------------
local opt = { noremap = true, silent = true }

-- Change of the leader key.
vim.g.mapleader = ' '

-- Disable the Ex mode.
vim.keymap.set('n', 'Q', '<Nop>', opt)
vim.keymap.set('n', 'gQ', '<Nop>', opt)

-- Disable default completion.
vim.keymap.set('i', '<C-n>', '<Nop>', opt)
vim.keymap.set('i', '<C-p>', '<Nop>', opt)

-- Switch to the normal mode.
vim.keymap.set('i', 'jj', '<ESC>', opt)

-- Paste configuration.
vim.keymap.set('v', '<Leader>p', '<Plug>(operator-replace)', opt)

-- Cursol movement.
vim.keymap.set({ 'n', 'v' }, '<C-h>', '0', opt)
vim.keymap.set({ 'n', 'v' }, '<C-l>', '$', opt)

-- Window
vim.keymap.set('n', '<C-w>n', '<cmd>vnew<CR>', opt)
vim.keymap.set('n', '<C-w>N', '<cmd>new<CR>', opt)

-- Tab
vim.keymap.set('n', 'gn', ':tabnew<CR>', opt)
vim.keymap.set('n', 'gc', ':tabclose<CR>', opt)

-- LSP
vim.api.nvim_set_keymap('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
vim.api.nvim_set_keymap('n', '<Leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
vim.api.nvim_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opt)

-- Plugins
vim.keymap.set('n', 'F', '<cmd>HopChar2<CR>', opt)
vim.keymap.set({ 'n', 'v' }, 'co', '<Plug>NERDCommenterToggle', opt) 
vim.keymap.set('v', '<Leader>t', '<cmd>TranslateJa2En<CR>', opt)
vim.keymap.set('v', '<Leader>j', '<cmd>TranslateEn2Ja<CR>', opt)
vim.keymap.set('n', '<Leader>f', '<cmd>Ddu file_external<CR>', opt)
vim.keymap.set('n', '<Leader>h', '<cmd>Ddu mr -source-param-current=v:true<CR>', opt)
vim.keymap.set('n', '<Leader>b', '<cmd>Ddu buffer<CR>', opt)
vim.keymap.set('n', '<Leader>gg', '<cmd>DduRg<CR>', opt)
vim.keymap.set('n', '<Leader>gw', '<cmd>DduRgCWord<CR>', opt)
vim.keymap.set('n', '<Leader>e', '<cmd>Ddu -name=filer -ui=filer -resume -source-option-path=`getcwd()` -source-option-columns=filename file<CR>', opt)

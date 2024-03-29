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

-- Yank
vim.keymap.set('v', 'p', '"_dP', opt)

-- LSP
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
vim.keymap.set('n', '<Leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', opt)
vim.keymap.set('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opt)

-- Plugins
vim.keymap.set('n', 'F', '<cmd>HopChar1<CR>', opt)
vim.keymap.set('n', 'co', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('v', 'co', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', opt) 
vim.keymap.set('v', '<Leader>t', '<cmd>Translate ja en<CR>', opt)
vim.keymap.set('v', '<Leader>j', '<cmd>Translate en ja<CR>', opt)
vim.keymap.set('n', '<Leader>f', '<cmd>Telescope find_files<CR>', opt)
vim.keymap.set('n', '<Leader>g', '<cmd>Telescope live_grep<CR>', opt)
vim.keymap.set('n', '<Leader>b', '<cmd>Telescope buffers<CR>', opt)
vim.keymap.set('n', '<Leader>t', '<cmd>Telescope filetypes<CR>', opt)
vim.keymap.set('n', '<Leader>h', '<cmd>Telescope oldfiles<CR>', opt)

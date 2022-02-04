--------------------------------
-- Key mappings
--------------------------------
-- Change of the leader key.
vim.g.mapleader = ' '

-- Disable the Ex mode.
vim.keymap.set('n', 'Q', '<Nop>', { noremap = true })
vim.keymap.set('n', 'gQ', '<Nop>', { noremap = true })

-- Disable default completion.
vim.keymap.set('i', '<C-n>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<C-p>', '<Nop>', { noremap = true })

-- Switch to the normal mode.
vim.keymap.set('i', 'jj', '<ESC>', { noremap = true })

-- Paste configuration.
vim.keymap.set('v', '<Leader>p', '<Plug>(operator-replace)')

-- Cursol movement.
vim.keymap.set({ 'n', 'v' }, '<C-h>', '0', { noremap = true })
vim.keymap.set({ 'n', 'v' }, '<C-l>', '$', { noremap = true })

-- Window
vim.keymap.set('n', '<C-w>n', '<cmd>vnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>N', '<cmd>new<CR>', { noremap = true, silent = true })

-- Tab
vim.keymap.set('n', 'gn', ':tabnew<CR>', { noremap = true })
vim.keymap.set('n', 'gc', ':tabclose<CR>', { noremap = true })

-- LSP
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true }) 
vim.keymap.set('n', '<Leader>k', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true }) 
vim.keymap.set('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references(<CR>', { noremap = true, silent = true }) 

-- Plugins
vim.keymap.set('i', '<C-j>', [[copilot#Accept("\<CR>")]], { silent = true, script = true, expr = true }) 
vim.keymap.set({ 'n', 'v' }, 'co', '<Plug>NERDCommenterToggle', { noremap = false }) 
vim.keymap.set('n', '<Leader>o', '<cmd>SymbolsOutline<CR>', { noremap = true, silent = true }) 
vim.keymap.set('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true }) 
vim.keymap.set('v', '<Leader>t', '<cmd>TranslateJa2En<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<Leader>j', '<cmd>TranslateEn2Ja<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>m', '<Plug>(easymotion-overwin-f2)', { noremap = false }) 
vim.keymap.set('n', '<Leader>f', '<cmd>Ddu file_rec_from_rg<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>h', '<cmd>Ddu mr -source-param-current=v:true<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>b', '<cmd>Ddu buffer<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>g', '<cmd>DduRg<CR>', { noremap = true, silent = true })

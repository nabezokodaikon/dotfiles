--------------------------------
-- Key mappings
--------------------------------
-- Change of the leader key.
vim.g.mapleader = ' '

-- Paste configuration.
vim.keymap.set('v', '\\', '"0p')

-- Disable the Ex mode.
vim.keymap.set('n', 'Q', '<Nop>', { noremap = true })
vim.keymap.set('n', 'gQ', '<Nop>', { noremap = true })

-- Switch to the normal mode.
vim.keymap.set('i', 'jj', '<ESC>', { noremap = true })

-- Window
vim.keymap.set('n', '<C-w>n', '<cmd>vnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>N', '<cmd>new<CR>', { noremap = true, silent = true })

-- Tab
vim.keymap.set('n', 'gn', ':tabnew<CR>', { noremap = true })
vim.keymap.set('n', 'gc', ':tabclose<CR>', { noremap = true })

-- Plugins
vim.keymap.set('i', '<C-j>', [[copilot#Accept("\<CR>")]], { silent = true, script = true, expr = true }) 
vim.keymap.set({ 'n', 'v' }, 'co', '<Plug>NERDCommenterToggle', { noremap = false }) 
vim.keymap.set('n', '<Leader>o', '<cmd>SymbolsOutline<CR>', { noremap = true, silent = true }) 
vim.keymap.set('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true }) 
vim.keymap.set('v', '<Leader>t', '<cmd>TranslateJa2En<CR>', { noremap = true, silent = true })
vim.keymap.set('v', '<Leader>j', '<cmd>TranslateEn2Ja<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>m', '<Plug>(easymotion-overwin-f2)', { noremap = false }) 
vim.keymap.set('n', '<Leader>f', '<cmd>Telescope find_files previewer=false find_command=rg,--files,--hidden,--glob,!.git/*<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>g', '<cmd>Telescope live_grep previewer=false<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>b', '<cmd>Telescope buffers previewer=false<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>t', '<cmd>Telescope filetypes previewer=false<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>h', '<cmd>Telescope oldfiles previewer=false only_cwd=true<CR>', { noremap = true, silent = true })

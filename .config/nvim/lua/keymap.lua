--------------------------------
-- Key mappings
--------------------------------
local api = vim.api

-- Disable the Ex mode.
api.nvim_set_keymap('n', 'Q', '<Nop>', { noremap = true })
api.nvim_set_keymap('n', 'gQ', '<Nop>', { noremap = true })

-- Switch to the normal mode.
api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true })

-- Jump to the line head and tail.
api.nvim_set_keymap('n', '<C-h>', '0', { noremap = true })
api.nvim_set_keymap('n', '<C-l>', '$', { noremap = true })
api.nvim_set_keymap('v', '<C-h>', '0', { noremap = true })
api.nvim_set_keymap('v', '<C-l>', '$', { noremap = true })

-- Disable completion.
api.nvim_set_keymap('i', '<C-n>', '<Nop>', { noremap = true })
api.nvim_set_keymap('i', '<C-p>', '<Nop>', { noremap = true })

-- Change of the leader key.
vim.g.mapleader = ' '

-- File reload.
api.nvim_set_keymap('n', '<Leader>\\', ':e!<CR>', { noremap = true, silent = true })

-- Split
api.nvim_set_keymap('n', '<C-w>s', ':vsplit<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-w>S', ':split<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-w>n', ':vnew<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-w>N', ':new<CR>', { noremap = true, silent = true })

-- Tab
api.nvim_set_keymap('n', 'gn', ':tabnew<CR>', { noremap = true })
api.nvim_set_keymap('n', 'gc', ':tabclose<CR>', { noremap = true })

-- Plugins
vim.api.nvim_set_keymap('i', '<C-j>', [[copilot#Accept("\<CR>")]], { silent = true, script = true, expr = true }) 
vim.api.nvim_set_keymap('n', 'co', '<Plug>NERDCommenterToggle', { noremap = false }) 
vim.api.nvim_set_keymap('v', 'co', '<Plug>NERDCommenterToggle', { noremap = false }) 
vim.api.nvim_set_keymap('n', '<Leader>o', '<cmd>SymbolsOutline<CR>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true }) 
vim.api.nvim_set_keymap('v', '<Leader>t', '<cmd>TranslateJa2En<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>j', '<cmd>TranslateEn2Ja<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>m', '<Plug>(easymotion-overwin-f2)', { noremap = false }) 
vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>Telescope find_files previewer=false find_command=rg,--files,--hidden,--glob,!.git/*<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>g', '<cmd>Telescope live_grep previewer=false<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>b', '<cmd>Telescope buffers previewer=false<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>t', '<cmd>Telescope filetypes previewer=false<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', '<cmd>Telescope oldfiles previewer=false only_cwd=true<CR>', { noremap = true, silent = true })

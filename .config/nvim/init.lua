--------------------------------
-- Initial settings
--------------------------------
vim.cmd('filetype off')
vim.cmd('syntax off')


-- TODO: OS判定。
-- https://github.com/glepnir/nvim/blob/master/lua/core/global.lua


-- Set disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0


-- Basic settings
require('basic')

-- Key mappings
require('mappings')

-- File type settings
require('filetypes')

-- Plugins settings
require('plugin-manager')

-- Tab settings
vim.cmd [[source ~/.config/nvim/rc/tab.rc.vim]]


vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

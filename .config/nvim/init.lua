--------------------------------
-- Initial settings
--------------------------------
vim.cmd('syntax off')
vim.cmd('filetype off')
vim.cmd('filetype plugin indent off')


-- TODO: OS判定。
-- https://github.com/glepnir/nvim/blob/master/lua/core/global.lua


-- Set disable providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0


-- Basic settings.
require('basic')

-- Key mappings.
require('keymap')

-- Virtual text settings.
require('virtual-text')

-- Plugins settings.


vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')

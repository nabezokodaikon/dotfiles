--------------------------------
-- Initial settings
--------------------------------
vim.cmd('filetype off')
vim.cmd('filetype plugin indent off')
vim.cmd('syntax off')


vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 0


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
require('plugins.dein')


vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

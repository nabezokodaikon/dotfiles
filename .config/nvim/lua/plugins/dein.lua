--------------------------------
-- dein.vim settings
--------------------------------
local cache_dir = vim.env.HOME .. '/.cache'
local dein_dir = cache_dir .. '/dein'
local dein_repo_dir = dein_dir .. '/repos/github.com/Shougo/dein.vim'

if not string.match(vim.o.runtimepath, '/dein.vim') then
	if vim.fn.isdirectory(dein_repo_dir) ~= 1 then
		os.execute('git clone https://github.com/Shougo/dein.vim ' .. dein_repo_dir)
	end
	vim.o.runtimepath = dein_repo_dir .. ',' .. vim.o.runtimepath 
end

if vim.call('dein#min#load_state', dein_dir) ~= 1 then
    return
end

local dein_toml_dir = vim.env.HOME .. '/.config/nvim/dein'
local dein_toml = dein_toml_dir .. '/dein.toml'
local dein_toml_lazy = dein_toml_dir .. '/deinlazy.toml'
local dein_toml_nvim_cmp = dein_toml_dir .. '/nvim-cmp.toml'

vim.call('dein#begin', dein_dir, { vim.fn.expand('<sfile>'), dein_toml, dein_toml_lazy })

vim.call('dein#load_toml', dein_toml, { lazy = 0 })
vim.call('dein#load_toml', dein_toml_lazy, { lazy = 1 })
vim.call('dein#load_toml', dein_toml_nvim_cmp, { lazy = 1 })

vim.call('dein#end')
vim.call('dein#save_state')

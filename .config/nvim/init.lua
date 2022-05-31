vim.cmd('syntax off')
vim.cmd('filetype off')
vim.cmd('filetype plugin indent off')

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

vim.call('dein#begin', dein_dir)

vim.call('dein#add', 'neovim/nvim-lspconfig')
vim.call('dein#add', 'vim-denops/denops.vim')
vim.call('dein#add', 'Shougo/ddc.vim')
vim.call('dein#add', 'Shougo/ddc-matcher_head')
vim.call('dein#add', 'Shougo/ddc-sorter_rank')
vim.call('dein#add', 'Shougo/ddc-nvim-lsp')

vim.call('dein#end')
vim.call('dein#save_state')


require'lspconfig'.rust_analyzer.setup {}

vim.call('ddc#custom#patch_global',
  'sources', {'nvim-lsp'})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {matchers = {'matcher_head'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {sorters = {'sorter_rank'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['nvim-lsp'] = {mark = '[LSP]'}})
vim.call('ddc#custom#patch_filetype', 'rust',
  'sourceOptions', {['nvim-lsp'] = {forceCompletionPattern = [[\.\w*|::\w*]]}})
vim.call('ddc#enable')

vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')

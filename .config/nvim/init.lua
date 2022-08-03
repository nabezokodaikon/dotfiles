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

vim.call('dein#add', 'vim-denops/denops.vim')
vim.call('dein#add', 'Shougo/ddu.vim')
vim.call('dein#add', 'Shougo/ddu-commands.vim')
vim.call('dein#add', 'Shougo/ddu-ui-filer')
vim.call('dein#add', 'Shougo/ddu-kind-file')
vim.call('dein#add', 'Shougo/ddu-source-file')
vim.call('dein#add', 'Shougo/ddu-column-filename')

vim.call('dein#end')
vim.call('dein#save_state')

vim.call('ddu#custom#patch_global',
  'uiOptions', {filer = {
    toggle = true,
  }})

vim.call('ddu#custom#patch_global',
  'uiParams', {filer = {
    split ='no',
    toggle = true,
  }})

function ddu_filer_my_settings()
  vim.keymap.set('n', 'n', "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>", { noremap = true, buffer = true })
end

local ddu_filer_groupname = 'ddu-filer-group'
vim.api.nvim_create_augroup(ddu_filer_groupname, { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = ddu_filer_groupname,
  pattern = 'ddu-filer',
  callback = ddu_filer_my_settings
})

vim.keymap.set('n', 'e', '<cmd>Ddu -ui=filer -source-option-columns=filename file<CR>', {})

vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')

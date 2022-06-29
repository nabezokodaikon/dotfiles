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

vim.call('dein#add', 'rust-lang/rust.vim')
vim.call('dein#add', 'neovim/nvim-lspconfig')
vim.call('dein#add', 'hrsh7th/nvim-cmp')
vim.call('dein#add', 'hrsh7th/cmp-nvim-lsp')

vim.call('dein#end')
vim.call('dein#save_state')


require'lspconfig'.rust_analyzer.setup {}

local cmp = require('cmp')

cmp.setup {

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
    }),
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }),
}

vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')

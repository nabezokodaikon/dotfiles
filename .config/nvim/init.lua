vim.cmd('syntax off')
vim.cmd('filetype off')
vim.cmd('filetype plugin indent off')


local dpp_base = vim.env.HOME .. '/.cache/dpp'
local dpp_repo = dpp_base .. '/repos'

local dpp_src = dpp_repo .. '/github.com/Shougo/dpp.vim'
local denops_src = dpp_repo .. '/github.com/vim-denops/denops.vim'

vim.opt.runtimepath:prepend(dpp_src)

if vim.fn.isdirectory(dpp_src) ~= 1 then
  os.execute('git clone https://github.com/Shougo/dpp.vim ' .. dpp_src)
end

if vim.fn.isdirectory(denops_src) ~= 1 then
  os.execute('git clone https://github.com/vim-denops/denops.vim ' .. denops_src)
end

local plugins = {
  'Shougo/dpp-ext-installer',
  'Shougo/dpp-ext-local',
  'Shougo/dpp-ext-lazy',
  'Shougo/dpp-ext-toml',
  'Shougo/dpp-protocol-git',
}

for k, v in pairs(plugins) do
  local url = 'https://github.com/' .. v
  local repo = dpp_repo .. '/github.com/' .. v 
  vim.opt.runtimepath:append(repo)
  if vim.fn.isdirectory(repo) ~= 1 then
    os.execute('git clone ' .. url .. ' ' .. repo)
  end
end

if vim.call('dpp#min#load_state', dpp_base) then
  vim.opt.runtimepath:prepend(denops_src)
  vim.api.nvim_create_autocmd('User', {
    pattern = 'DenopsReady',
    callback = function()
      vim.call('dpp#make_state', dpp_base, '~/.config/nvim/dpp/dpp.ts')
    end,
  })
end


vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')

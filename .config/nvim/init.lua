vim.cmd('syntax off')
vim.cmd('filetype off')
vim.cmd('filetype plugin indent off')


local dpp_base = vim.env.HOME .. '/.cache/dpp'
local dpp_repo = dpp_base .. '/repos'

function init_plugin(plugin)
  local dir = dpp_repo .. '/github.com/' .. plugin
  if vim.fn.isdirectory(dir) ~= 1 then
    local url = 'https://github.com/' .. plugin
    os.execute('git clone ' .. url .. ' ' .. dir)
  end
  vim.opt.runtimepath:prepend(dir)
end

init_plugin('Shougo/dpp.vim')
init_plugin('Shougo/dpp-ext-lazy')

if vim.call('dpp#min#load_state', dpp_base) then

  init_plugin('Shougo/dpp-ext-installer')
  init_plugin('Shougo/dpp-ext-toml')
  init_plugin('Shougo/dpp-protocol-git')
  init_plugin('vim-denops/denops.vim')

  vim.api.nvim_create_autocmd('User', {
    pattern = 'DenopsReady',
    callback = function()
      vim.call('dpp#make_state', dpp_base, '~/.config/nvim/dpp.ts')
    end,
  })
end


vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')


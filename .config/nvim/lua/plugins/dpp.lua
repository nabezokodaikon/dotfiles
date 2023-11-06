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

  local plugins = {
    'Shougo/dpp-ext-installer',
    'Shougo/dpp-ext-local',
    'Shougo/dpp-ext-toml',
    'Shougo/dpp-protocol-git',
    'vim-denops/denops.vim',
  }

  for k, v in pairs(plugins) do
    init_plugin(v)
  end

  vim.api.nvim_create_autocmd('User', {
    pattern = 'DenopsReady',
    callback = function()
      vim.call('dpp#make_state', dpp_base, '~/.config/nvim/dpp/dpp.ts')
    end,
  })
end


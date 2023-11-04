-- Set dpp base path (required)
local dpp_base = vim.env.HOME .. '/.cache/dpp'
local dpp_repo = dpp_base .. '/repos'

-- Set dpp source path (required)
local dpp_src = dpp_repo .. '/github.com/Shougo/dpp.vim'
local denops_src = dpp_repo .. '/github.com/vim-denops/denops.vim'
local dpp_installer_src = dpp_repo .. '/github.com/Shougo/dpp-ext-installer'
local dpp_local_src = dpp_repo .. '/github.com/Shougo/dpp-ext-local'
local dpp_lazy_src = dpp_repo .. '/github.com/Shougo/dpp-ext-lazy'
local dpp_toml_src = dpp_repo .. '/github.com/Shougo/dpp-ext-toml'
local dpp_protocol_src = dpp_repo .. '/github.com/Shougo/dpp-protocol-git'

-- Set dpp runtime path (required)
vim.opt.runtimepath:prepend(dpp_src)

vim.opt.runtimepath:append(dpp_installer_src)
vim.opt.runtimepath:append(dpp_local_src)
vim.opt.runtimepath:append(dpp_lazy_src)
vim.opt.runtimepath:append(dpp_toml_src)
vim.opt.runtimepath:append(dpp_protocol_src)

if vim.fn.isdirectory(dpp_src) ~= 1 then
  os.execute('git clone https://github.com/Shougo/dpp.vim ' .. dpp_src)
end

if vim.fn.isdirectory(denops_src) ~= 1 then
  os.execute('git clone https://github.com/vim-denops/denops.vim ' .. denops_src)
end

if vim.fn.isdirectory(dpp_installer_src) ~= 1 then
  os.execute('git clone https://github.com/Shougo/dpp-ext-installer ' .. dpp_installer_src)
end

if vim.fn.isdirectory(dpp_local_src) ~= 1 then
  os.execute('git clone https://github.com/Shougo/dpp-ext-local ' .. dpp_local_src)
end

if vim.fn.isdirectory(dpp_lazy_src) ~= 1 then
  os.execute('git clone https://github.com/Shougo/dpp-ext-lazy ' .. dpp_lazy_src)
end

if vim.fn.isdirectory(dpp_toml_src) ~= 1 then
  os.execute('git clone https://github.com/Shougo/dpp-ext-toml ' .. dpp_toml_src)
end

if vim.fn.isdirectory(dpp_protocol_src) ~= 1 then
  os.execute('git clone https://github.com/Shougo/dpp-protocol-git ' .. dpp_protocol_src)
end


if vim.call('dpp#min#load_state', dpp_base) then
  -- Set dpp runtime path (required)
  vim.opt.runtimepath:prepend(denops_src)
  vim.api.nvim_create_autocmd('User', {
    pattern = 'DenopsReady',
    callback = function()
      vim.call('dpp#make_state', dpp_base, '~/.config/nvim/dpp/dpp.ts')
    end,
  })
end


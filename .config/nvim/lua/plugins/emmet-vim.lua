vim.g.user_emmet_install_global = false
vim.g.user_emmet_leader_key = '<C-e>'

local groupname = 'my-emmet-setting'
vim.api.nvim_create_augroup(groupname, { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = groupname,
  pattern = {
    'html',
    'css',
    'scss',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact'
  },
  callback = function()
    vim.cmd('EmmetInstall')
  end,
})

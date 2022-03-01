vim.g.user_emmet_install_global = false
vim.g.user_emmet_leader_key = '<C-e>'

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'html,css,scss,javascript,javascriptreact,typescript,typescriptreact',
  callback = function()
               vim.cmd('EmmetInstall')
             end,
})

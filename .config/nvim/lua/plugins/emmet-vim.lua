vim.g.user_emmet_install_global = false
vim.g.user_emmet_leader_key = '<C-e>'
vim.cmd [[
  augroup emmet_my_settings
      autocmd!
      autocmd FileType
      \ html,css,scss,javascript,javascriptreact,typescript,typescriptreact
      \ EmmetInstall
  augroup END
]]

vim.call('ddc#custom#patch_global',
  'sources', {'around', 'nvim-lsp'})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {matchers = {'matcher_head'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {sorters = {'sorter_rank'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['around'] = {mark = {'Buf'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['nvim-lsp'] = {mark = {'LSP'}}})

vim.call('ddc#enable')

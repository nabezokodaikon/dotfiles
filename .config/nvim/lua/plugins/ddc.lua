vim.call('ddc#custom#patch_global',
  'sources', {'nvim-lsp_by-treesitter', 'file', 'around'})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {matchers = {'matcher_head'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {sorters = {'sorter_rank'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {minAutoCompleteLength = {1}}})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {['around'] = {mark = {'Buf'}}})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {['nvim-lsp_by-treesitter'] = {mark = {'LSP'}}})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {['file'] = {mark = {'File'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['file'] = {isVolatile = {true}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['file'] = {forceCompletionPattern = {[[\S/\S*]]}}})

vim.call('ddc#enable')

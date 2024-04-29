vim.call('ddc#custom#patch_global', 'ui', 'native')

vim.call('ddc#custom#patch_global',
  'sources', {'around', 'file', 'lsp', 'skkeleton'})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {matchers = {'matcher_head'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {sorters = {'sorter_rank'}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {_ = {minAutoCompleteLength = 1}})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {['around'] = {mark = '[Buf]'}})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {['lsp'] = {mark = '[LSP]'}})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {['file'] = {mark = '[File]'}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['file'] = {isVolatile = {true}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['file'] = {forceCompletionPattern = [[\S/\S*]]}})

vim.call('ddc#custom#patch_global',
  'sourceOptions', {['skkeleton'] = {mark = '[SKK]'}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['skkeleton'] = {matchers = {}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['skkeleton'] = {sorters = {}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['skkeleton'] = {converters = {}}})
vim.call('ddc#custom#patch_global',
  'sourceOptions', {['skkeleton'] = {isVolatile = {true}}})

vim.call('ddc#enable')


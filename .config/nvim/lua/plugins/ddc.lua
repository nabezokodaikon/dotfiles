vim.fn['ddc#custom#patch_global'] {
  ui = 'native',
  sources = {
    'around', 'file', 'lsp', 'skkeleton',
  },
  sourceOptions = {
    _ = {
      matchers = {'matcher_head'},
      sorters = {'sorter_rank'},
      minAutoCompleteLength = 1,
    },
    ['around'] = {
      mark = '[Buf]'
    },
    ['lsp'] = {
      mark = '[LSP]'
    },
    ['file'] = {
      mark = '[File]',
      isVolatile = true,
      forceCompletionPattern = [[\S/\S*]],
    },
    ['skkeleton'] = {
      mark = '[SKK]',
      matchers = {},
      sorters = {},
      converters = {},
      isVolatile = true,
      minAutoCompleteLength = 1,
    },
  },
}

vim.fn['ddc#enable'] {}


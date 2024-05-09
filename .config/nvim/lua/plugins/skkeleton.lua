require('skkeleton_indicator').setup {}

vim.fn['skkeleton#config'] {
  databasePath = 
    '~/.cache/skk/skkeleton.db'
  ,
  globalDictionaries = {
    '~/.local/share/skk/SKK-JISYO.L',
  },
}

vim.fn['skkeleton#register_kanatable']('rom', {
    ['jj'] = 'escape',
})


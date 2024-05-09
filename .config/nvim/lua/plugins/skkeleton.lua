require('skkeleton_indicator').setup {}

vim.fn['skkeleton#config'] {
  databasePath = 
    '~/.cache/skkeleton.db'
  ,
  globalDictionaries = {
    '~/.local/share/skk/SKK-JISYO.L',
  },
}

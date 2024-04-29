require('skkeleton_indicator').setup {}

vim.fn['skkeleton#config'] {
  databasePath = 
    '~/.local/src/skk/skk-jisyo'
  ,
  globalDictionaries = {
    '~/.local/src/skk/SKK-JISYO.L',
  },
}

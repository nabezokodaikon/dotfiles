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

require('skkeleton_indicator').setup {
  eijiHlName = "LineNr",
  hiraHlName = "String",
  kataHlName = "Todo",
  hankataHlName = "Special",
  zenkakuHlName = "LineNr",
  abbrevHlName = "Error",
}


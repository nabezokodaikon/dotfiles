vim.fn['ddc#custom#patch_global'] {
  ui = 'pum',
  autoCompleteEvents = {
    'InsertEnter',
    'TextChangedI',
    'TextChangedP',
    'TextChangedT',
  },
  sources = {
    'around', 'file', 'lsp', 'skkeleton',
  },
  backspaceCompletion = true,
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

local opt = { noremap = true, silent = true }
vim.keymap.set('i', '<C-y>',   function() vim.fn['pum#map#confirm']() end  , opt)
vim.keymap.set('i', '<C-e>',   function() vim.fn['pum#map#cancel']() end  , opt)
vim.keymap.set('i', '<TAB>',   function() tab_complete() end, opt)
vim.keymap.set('i', '<S-TAB>', function() vim.fn['pum#map#insert_relative'](-1) end , opt)

function tab_complete()
  if vim.fn['pum#visible']() then
    vim.fn['pum#map#insert_relative'](1)
    return ''
  end

  local col = vim.fn.col '.'
  if col <= 1 or vim.fn.getline('.'):sub(col - 1):match '%s' then
    local key = vim.api.nvim_replace_termcodes('<Tab>', true, false, true)
    return vim.api.nvim_feedkeys(key, 'n', true)
  else
    vim.fn['ddc#map#manual_complete']()
    return ''
  end
end

vim.fn['ddc#enable']()


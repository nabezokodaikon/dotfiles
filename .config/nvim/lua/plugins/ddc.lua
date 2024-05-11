vim.fn['ddc#custom#patch_global'] {
  ui = 'pum',
  autoCompleteEvents = {
    'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged',
  },
  sources = {
    'around', 'file', 'lsp', 'skkeleton',
  },
  cmdlineSources = {
    [':'] = { 'cmdline', 'cmdline-history', 'around', }
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
    ['cmdline'] = {
      mark = '[CMD]'
    },
    ['cmdline-history'] = {
      mark = '[History]'
    },
  },
}

local opt = { noremap = true, silent = true }
vim.keymap.set('i', '<C-n>',   function() vim.fn['pum#map#select_relative'](1) end, opt)
vim.keymap.set('i', '<C-p>',   function() vim.fn['pum#map#select_relative'](-1) end, opt)
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

vim.keymap.set('n', ':', function() command_line_pre() end , opt)

function command_line_pre()
  local opt = { noremap = true, silent = true }

  vim.keymap.set("c", "<TAB>", function()
    if vim.fn["ddc#visible"]() then
      vim.fn["pum#map#insert_relative"](1)
    else
      return vim.fn["ddc#map#manual_complete"]()
    end
  end, { expr = true, replace_keycodes = false })

  vim.keymap.set("c", "<S-TAB>", function()
    if vim.fn["ddc#visible"]() then
      vim.fn["pum#map#insert_relative"](-1)
    else
      return vim.fn["ddc#map#manual_complete"]()
    end
  end, { expr = true, replace_keycodes = false })

  vim.keymap.set('c', '<C-n>',   function() vim.fn['pum#map#select_relative'](1) end, opt)
  vim.keymap.set('c', '<C-p>',   function() vim.fn['pum#map#select_relative'](-1) end, opt)
  vim.keymap.set('c', '<C-y>',   function() vim.fn['pum#map#confirm']() end, opt)
  vim.keymap.set('c', '<C-e>',   function() vim.fn['pum#map#cancel']() end, opt)

  vim.api.nvim_create_autocmd('User', {
    pattern = 'DDCCmdlineLeave',
    callback = function()
      command_line_post()
    end,
    once = true,
  })

  vim.fn['ddc#enable_cmdline_completion']()
  vim.api.nvim_feedkeys(':', 'n', true)
end

function command_line_post()
  local opt = { noremap = false, silent = true }
  vim.keymap.set('c', '<Tab>',   '<Nop>', opt)
  vim.keymap.set('c', '<S-Tab>', '<Nop>', opt)
  vim.keymap.set('c', '<C-n>',   '<Nop>', opt)
  vim.keymap.set('c', '<C-p>',   '<Nop>', opt)
  vim.keymap.set('c', '<C-y>',   '<Nop>', opt)
  vim.keymap.set('c', '<C-e>',   '<Nop>', opt)
end

vim.fn['ddc#enable']()


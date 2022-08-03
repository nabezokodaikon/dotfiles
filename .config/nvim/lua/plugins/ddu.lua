vim.call('ddu#custom#patch_global',
  'ui', {'ff'})
vim.call('ddu#custom#patch_global',
  'sourceOptions', {_ = {matchers = {'matcher_fzf'}}})
vim.call('ddu#custom#patch_global',
  'kindOptions', {_ = {defaultAction = {'open'}}})
vim.call('ddu#custom#patch_global',
  'sourceParams', {file_external = {
    cmd = {
      'rg',
      '--files',
      '--hidden',
      '--glob',
      "!.git/*",
    }}})
vim.call('ddu#custom#patch_global',
  'sourceParams', {rg = {
    args = {
      '--column',
      '--hidden',
      '--no-heading',
      '--color',
      'never',
      '--glob',
      "!.git/*",
    }}})
vim.call('ddu#custom#patch_global',
  'uiOptions', {filer = {
    toggle = true,
  }})

local winWidth = math.floor(vim.o.columns * 0.8)
local winCol = math.floor((vim.o.columns - winWidth) / 2)
vim.call('ddu#custom#patch_global',
  'uiParams', {ff = {
    filterFloatingPosition = 'top',
    prompt = '>',
    split ='floating',
    winCol = winCol,
    winRow = 1,
    winWidth = winWidth
  }})
vim.call('ddu#custom#patch_global',
  'uiParams', {filer = {
    split ='no',
    toggle = true,
  }})

function ddu_my_settings()
  local opt = { noremap = true, buffer = true, silent = true }
  vim.keymap.set('n', '<CR>', "<Cmd>call ddu#ui#ff#do_action('itemAction')<CR>", opt)
  vim.keymap.set('n', 'i', "<Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>", opt)
  vim.keymap.set('n', 'q', "<Cmd>call ddu#ui#ff#do_action('quit')<CR>", opt)
end

function ddu_filter_my_settings()
  local opt = { noremap = true, buffer = true, silent = true }
  vim.keymap.set('i', '<CR>', "<ESC><Cmd>call ddu#ui#ff#close()<CR>", opt)
  vim.keymap.set('i', '<ESC>', "<ESC><Cmd>call ddu#ui#ff#close()<CR>", opt)
  vim.keymap.set('i', 'jj', "<ESC><Cmd>call ddu#ui#ff#close()<CR>", opt)
  vim.keymap.set('n', '<CR>', "<Cmd>call ddu#ui#ff#close()<CR>", opt)
end

function ddu_filer_my_settings()
  local openFunc = function()
    if vim.api.nvim_eval('ddu#ui#filer#is_directory()') then
      return "<Cmd>call ddu#ui#filer#do_action('expandItem', {'mode': 'toggle'})<CR>"
    else
      return "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"
    end
  end
  local openOpt = { noremap = true, buffer = true, expr = true }
  vim.keymap.set('n', '<CR>', openFunc, openOpt)
  vim.keymap.set('n', 'o', openFunc, openOpt)

  local opt = { noremap = true, buffer = true }
  vim.keymap.set('n', 'q', "<Cmd>call ddu#ui#filer#do_action('quit')<CR>", opt)
  vim.keymap.set('n', '<C-l>', "<Cmd>call ddu#ui#filer#do_action('checkItems')<CR>", opt)
  vim.keymap.set('n', 'l', "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>", opt)
  vim.keymap.set('n', 'h', "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>", opt)
  vim.keymap.set('n', 'c', "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'copy'})<CR>", opt)
  vim.keymap.set('n', 'm', "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'move'})<CR>", opt)
  vim.keymap.set('n', 'p', "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'paste'})<CR>", opt)
  vim.keymap.set('n', 'r', "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'rename'})<CR>", opt)
  vim.keymap.set('n', 'N', "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>", opt)
  vim.keymap.set('n', 'D', "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'trash'})<CR>", opt)
end

local ddu_ff_groupname = 'ddu-ff-group'
vim.api.nvim_create_augroup(ddu_ff_groupname, { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = ddu_ff_groupname,
  pattern = 'ddu-ff',
  callback = ddu_my_settings
})

local ddu_ff_filter_groupname = 'ddu-ff-filter-group'
vim.api.nvim_create_augroup(ddu_ff_filter_groupname, { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = ddu_ff_filter_groupname,
  pattern = 'ddu-ff-filter',
  callback = ddu_filter_my_settings
})

local ddu_filer_groupname = 'ddu-filer-group'
vim.api.nvim_create_augroup(ddu_filer_groupname, { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = ddu_filer_groupname,
  pattern = 'ddu-filer',
  callback = ddu_filer_my_settings
})

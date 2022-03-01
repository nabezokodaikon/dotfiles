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
      '--no-heading',
      '--color',
      'never',
    }}})

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

local opt = { noremap = true, buffer = true, silent = true}

function ddu_my_settings()
  vim.keymap.set('n', '<CR>', "<Cmd>call ddu#ui#ff#do_action('itemAction')<CR>", opt)
  vim.keymap.set('n', 'i', "<Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>", opt)
  vim.keymap.set('n', 'q', "<Cmd>call ddu#ui#ff#do_action('quit')<CR>", opt)
end

function ddu_filter_my_settings()
  vim.keymap.set('i', '<CR>', "<ESC><Cmd>close<CR>", opt)
  vim.keymap.set('i', '<ESC>', "<ESC><Cmd>close<CR>", opt)
  vim.keymap.set('i', 'jj', "<ESC><Cmd>close<CR>", opt)
  vim.keymap.set('n', '<CR>', "<Cmd>close<CR>", opt)
end

vim.cmd[[
autocmd FileType ddu-ff lua ddu_my_settings()
autocmd FileType ddu-ff-filter lua ddu_filter_my_settings()
]]

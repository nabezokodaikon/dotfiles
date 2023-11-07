vim.cmd('syntax off')
vim.cmd('filetype off')
vim.cmd('filetype plugin indent off')


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  {
    "Shougo/ddu.vim",
    config = function()
      vim.call('ddu#custom#patch_global',
        'filterParams', {matcher_fzf = {highlightMatched = 'Search'}})

      vim.call('ddu#custom#patch_local', 'files',
        'ui', 'ff')
      vim.call('ddu#custom#patch_local', 'files',
        'kindOptions', {file = {defaultAction = {'open'}}})
      vim.call('ddu#custom#patch_local', 'files',
        'sources', {{name = {'file_external'}}})
      vim.call('ddu#custom#patch_local', 'files',
        'sourceOptions', {_ = {matchers = {'matcher_fzf'}, sorters = {'sorter_fzf'}}})
      vim.call('ddu#custom#patch_local', 'files',
        'sourceParams', {file_external = {
          cmd = {
            'fd',
            '--type',
            'file',
            '--hidden',
            '--exclude',
            '.git',
          }}})

      vim.call('ddu#custom#patch_local', 'history-files',
        'ui', 'ff')
      vim.call('ddu#custom#patch_local', 'history-files',
        'kindOptions', {file = {defaultAction = {'open'}}})
      vim.call('ddu#custom#patch_local', 'history-files',
        'sources', {{name = {'file_old'}}})
      vim.call('ddu#custom#patch_local', 'history-files',
        'sourceOptions', {_ = {matchers = {'matcher_relative', 'matcher_fzf'}, sorters = {'sorter_fzf'}}})

      vim.call('ddu#custom#patch_local', 'buffers',
        'ui', 'ff')
      vim.call('ddu#custom#patch_local', 'buffers',
        'kindOptions', {file = {defaultAction = {'open'}}})
      vim.call('ddu#custom#patch_local', 'buffers',
        'sources', {{name = {'buffer'}, params = {current = true}}})
      vim.call('ddu#custom#patch_local', 'buffers',
        'sourceOptions', {_ = {matchers = {'matcher_fzf'}, sorters = {'sorter_fzf'}}})

      vim.api.nvim_create_user_command('DduFiler', function()
        vim.call('ddu#start', {
          ui = 'filer',
          resume = true,
          sync = true,
          sources = {{name = 'file'}},
          sourceOptions = {file = {columns = {'filename'}, path = vim.fn.getcwd(), sorters = {'sorter_alpha'}}},
        })
      end, {nargs = 0})

      local ff_win_width = math.floor(vim.o.columns * 0.8)
      local ff_win_col = math.floor((vim.o.columns - ff_win_width) / 2)
      vim.call('ddu#custom#patch_global',
        'uiParams', {ff = {
          startFilter = false,
          filterFloatingPosition = 'top',
          prompt = '>',
          split ='floating',
          winCol = ff_win_col,
          winRow = 1,
          winWidth = ff_win_width
        }})

      local filer_win_width = math.floor(vim.o.columns * 0.25)
      vim.call('ddu#custom#patch_global',
        'uiParams', {filer = {
          split ='floating',
          winCol = 1,
          winRow = 1,
          winWidth = filer_win_width,
          winHeight = vim.o.lines,
        }})

      function ddu_my_settings()
        local opt = { noremap = true, buffer = true, silent = true }
        vim.keymap.set('n', '<CR>', [[<Cmd>call ddu#ui#ff#do_action('itemAction')<CR>]], opt)
        vim.keymap.set('n', 'i', [[<Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>]], opt)
        vim.keymap.set('n', 'q', [[<Cmd>call ddu#ui#ff#do_action('quit')<CR>]], opt)
      end

      function ddu_filter_my_settings()
        local opt = { noremap = true, buffer = true, silent = true }
        vim.keymap.set('i', '<CR>', [[<ESC><Cmd>call ddu#ui#ff#do_action('closeFilterWindow')<CR>]], opt)
        vim.keymap.set('i', '<ESC>', [[<ESC><Cmd>call ddu#ui#ff#do_action('closeFilterWindow')<CR>]], opt)
        vim.keymap.set('i', 'jj', [[<ESC><Cmd>call ddu#ui#ff#do_action('closeFilterWindow')<CR>]], opt)
        vim.keymap.set('n', '<CR>', [[<Cmd>call ddu#ui#ff#do_action('closeFilterWindow')<CR>]], opt)
      end

      function ddu_filer_my_settings()
        local openFunc = function()
          if vim.call('ddu#ui#get_item').isTree then
            return [[<Cmd>call ddu#ui#filer#do_action('expandItem', {'mode': 'toggle'})<CR>]]
          else
            return [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>]]
          end
        end
        local openOpt = { noremap = true, buffer = true, expr = true }
        vim.keymap.set('n', '<CR>', openFunc, openOpt)
        vim.keymap.set('n', 'o', openFunc, openOpt)

        local opt = { noremap = true, buffer = true }
        vim.keymap.set('n', 'q', [[<Cmd>call ddu#ui#filer#do_action('quit')<CR>]], opt)
        vim.keymap.set('n', '<C-l>', [[<Cmd>call ddu#ui#filer#do_action('checkItems')<CR>]], opt)
        vim.keymap.set('n', 'l', [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>]], opt)
        vim.keymap.set('n', 'h', [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>]], opt)
        vim.keymap.set('n', 'c', [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'copy'})<CR>]], opt)
        vim.keymap.set('n', 'm', [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'move'})<CR>]], opt)
        vim.keymap.set('n', 'p', [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'paste'})<CR>]], opt)
        vim.keymap.set('n', 'r', [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'rename'})<CR>]], opt)
        vim.keymap.set('n', 'N', [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>]], opt)
        vim.keymap.set('n', 'D', [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'delete'})<CR>]], opt)
        vim.keymap.set('n', 'y', [[<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'yank'})<CR>]], opt)
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


    end,
    cmd = {
      'DduFiler',
    },
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddu-ui-ff",
      "Shougo/ddu-ui-filer",
      "yuki-yano/ddu-filter-fzf",
      "Shougo/ddu-filter-matcher_relative",
      "Shougo/ddu-kind-file",
      "Shougo/ddu-source-file",
      "matsui54/ddu-source-file_external",
      "shun/ddu-source-buffer",
      "shun/ddu-source-rg",
      "Shougo/ddu-source-file_old",
      "Shougo/ddu-column-filename",
      "Shougo/ddu-filter-sorter_alpha",
    },
  },
  {
    "Shougo/ddu-commands.vim",
    cmd = {
      'Ddu',
    },
    dependencies = {
      "Shougo/ddu.vim",
    },
  },
})

vim.keymap.set('n', '<Leader>f', '<cmd>Ddu -name=files<CR>', opt)
vim.keymap.set('n', '<Leader>e', '<cmd>DduFiler<CR>', opt)


vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')


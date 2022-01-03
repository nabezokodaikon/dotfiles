local api = vim.api
local opts = { noremap = true, silent = true }
local telescope = require('telescope');
local actions = require('telescope.actions');

telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob',
      '!.git/*',
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten = true,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
        i = {
            ["<C-d>"] = actions.close,
            ["<ESC>"] = actions.close,
            ["jj"] = actions.close,
            ["<C-u>"] = false,
            ["<C-f>"] = actions.preview_scrolling_down,
            ["<C-b>"] = actions.preview_scrolling_up,
        }
    },
    path_display = {
      truncate = 3,
    },
  },
}


api.nvim_set_keymap('n',
  '<Leader>f',
  [[<cmd>lua require('telescope.builtin').find_files({ previewer = false, find_command = {'rg', '--files', '--hidden', '--glob', '!.git/*' }, })<CR>]],
  opts)

api.nvim_set_keymap('n',
  '<Leader>g',
  [[<cmd>Telescope live_grep previewer=false<CR>]],
  opts)

api.nvim_set_keymap('n',
  '<Leader>b',
  [[<cmd>lua require('telescope.builtin').buffers({ previewer = false })<CR>]],
  opts)

api.nvim_set_keymap('n',
  '<Leader>t',
  [[<cmd>Telescope filetypes previewer=false cwd_only=v:true<CR>]],
  opts)

api.nvim_set_keymap('n',
  '<Leader>h',
  [[<cmd>lua require('telescope.builtin').oldfiles({ previewer = false, only_cwd = true })<CR>]],
  opts)

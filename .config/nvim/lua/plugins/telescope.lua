local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    set_env = { ['COLORTERM'] = 'truecolor' },
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
  },
  pickers = {
    find_files = {
      previewer = false,
      find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' },
    },
    live_grep = {
      previewer = false,
      additional_args = function(opts)
        return { '--hidden' }
      end,
    },
    buffers = {
      previewer = false,
    },
    oldfiles = {
      previewer = false,
      only_cwd = true,
    },
  },
}

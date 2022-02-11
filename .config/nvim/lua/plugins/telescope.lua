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
}

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', 'o',     api.node.open.edit,           opts('Open'))
  vim.keymap.set('n', '~',     api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview,        opts('Open Preview'))
  vim.keymap.set('n', 'R',     api.tree.reload,              opts('Refresh'))
  vim.keymap.set('n', 'N',     api.fs.create,                opts('Create'))
  vim.keymap.set('n', 'D',     api.fs.remove,                opts('Delete'))
  vim.keymap.set('n', 'r',     api.fs.rename,                opts('Rename'))
  vim.keymap.set('n', 'm',     api.fs.cut,                   opts('Cut'))
  vim.keymap.set('n', 'c',     api.fs.copy.node,             opts('Copy'))
  vim.keymap.set('n', 'p',     api.fs.paste,                 opts('Paste'))
  vim.keymap.set('n', 'y',     api.fs.copy.filename,         opts('Copy Name'))
  vim.keymap.set('n', 'Y',     api.fs.copy.absolute_path,    opts('Copy Absolute Path'))

end

require("nvim-tree").setup({
  filters = { custom = { "^.git$" } },
  on_attach = my_on_attach,
})


local tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
  view = {
    width = 35,
    mappings = {
      list = {
        { key = {"<CR>", "o"}, cb = tree_cb("edit") },
        { key = {"~"},         cb = tree_cb("cd") },
        { key = "<Tab>",       cb = tree_cb("preview") },
        { key = "R",           cb = tree_cb("refresh") },
        { key = "<C-n>",       cb = tree_cb("create") },
        { key = "D",           cb = tree_cb("remove") },
        { key = "r",           cb = tree_cb("rename") },
        { key = "m",           cb = tree_cb("cut") },
        { key = "c",           cb = tree_cb("copy") },
        { key = "p",           cb = tree_cb("paste") },
        { key = "y",           cb = tree_cb("copy_name") },
        { key = "Y",           cb = tree_cb("copy_absolute_path") },
        { key = "q",           cb = tree_cb("close") },
      },
    },
  },
}

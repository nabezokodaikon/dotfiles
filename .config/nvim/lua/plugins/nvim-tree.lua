require'nvim-tree'.setup {
  view = {
    width = 35,
    mappings = {
      list = {
        { key = {"<CR>", "o"}, action = "edit" },
        { key = {"~"},         action = "cd" },
        { key = "<Tab>",       action = "preview" },
        { key = "R",           action = "refresh" },
        { key = "N",       action = "create" },
        { key = "D",           action = "remove" },
        { key = "r",           action = "rename" },
        { key = "m",           action = "cut" },
        { key = "c",           action = "copy" },
        { key = "p",           action = "paste" },
        { key = "y",           action = "copy_name" },
        { key = "Y",           action = "copy_absolute_path" },
        { key = "q",           action = "close" },
      },
    },
  },
}

local cmp = require('cmp')

cmp.setup {

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      select = true,
    }),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'copilot' },
  },

  documentation = false,
}

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

local cmp = require('cmp')

cmp.setup {

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  },

  documentation = false,
}

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources(
  {{ name = 'path' }},
  {{ name = 'cmdline' }})
})



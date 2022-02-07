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
  },

  documentation = false,
}

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Disable completion on ddu.vim
-- https://github.com/hrsh7th/nvim-cmp/issues/106#issuecomment-908289674
vim.cmd[[
autocmd FileType ddu-std-filter lua require'cmp'.setup.buffer {
\   completion = {
\     autocomplete = false
\   }
\ }
]]

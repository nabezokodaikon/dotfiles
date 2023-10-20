--------------------------------
-- Treesitter configurations
--------------------------------
local treesitter = require"nvim-treesitter.configs"

treesitter.setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "rust",
    "svelte",
    "toml",
    "typescript",
    "vim",
    "yaml",
  },
  sync_install = false,
  highlight = {
      enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

require('Comment').setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

vim.treesitter.language.register('html', 'nue') 


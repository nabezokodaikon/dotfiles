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
      "help",
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
    }
}

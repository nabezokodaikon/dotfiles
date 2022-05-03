--------------------------------
-- Treesitter configurations
--------------------------------
local treesitter = require"nvim-treesitter.configs"

treesitter.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "phpdoc", "rust" },
    highlight = {
        enable = true,
    }
}

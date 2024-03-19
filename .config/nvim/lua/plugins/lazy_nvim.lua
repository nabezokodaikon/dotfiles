local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  {
    "folke/lazy.nvim",
  },
  {
    -- テキストを囲ったり、囲いを外したりする。
    "tpope/vim-surround",
  },
  {
    -- Copy paste
    "kana/vim-operator-replace",
    dependencies = {
      "kana/vim-operator-user",
    },
  },
  {
    -- Color scheme
    "ellisonleao/gruvbox.nvim",
    config = function() require("plugins.gruvbox") end,
  },
  {
    -- Status line
    "hoob3rt/lualine.nvim",
    config = function() require("plugins.lualine") end,
  },
  {
    -- Tab line
    "crispgm/nvim-tabline",
    config = function() require("plugins.nvim-tabline") end,
  },
  {
    -- Emmet
    "mattn/emmet-vim",
    ft = {
      'html',
      'css',
      'scss',
      'javascript',
      'javascriptreact',
      'nue',
      'typescript',
      'typescriptreact',
      'svelte',
    },
    init = function() require("plugins.emmet-vim") end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function() require("plugins.nvim-tree") end,
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
  },
  {
    -- Fuzzy finder
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    config = function() require("plugins.telescope") end,
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function() require("plugins.nvim-lspconfig") end,
  },
  {
    "hrsh7th/nvim-cmp",
    config = function() require("plugins.nvim-cmp") end,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
    },
    event = "InsertEnter",
  },
  {
    -- Rust configuration
    "rust-lang/rust.vim",
    config = function() require("plugins.rust") end,
    ft = {
      "rust",
    }
  },
  {
    -- VTL syntax
    "lepture/vim-velocity",
    ft = {
      "velocity",
    }
  },
  {
    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    config = function() require("plugins.nvim-treesitter") end,
    dependencies = {
      "numToStr/Comment.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    event = "BufRead",
  },
  {
    -- Translate
    "nabezokodaikon/translate.nvim",
    cmd = "Translate",
  },
  {
    --カーソル移動を便利にする。 
    "phaazon/hop.nvim",
    cmd = "HopChar1",
    config = function() require("plugins.hop") end,
  },
})

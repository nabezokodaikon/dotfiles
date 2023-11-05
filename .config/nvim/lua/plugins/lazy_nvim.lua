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
    "tpope/vim-surround",
  },
  {
    "scrooloose/nerdcommenter",
    config = function() require("plugins.nerdcommenter") end,
  },
  {
    "kana/vim-operator-replace",
    dependencies = {
      "kana/vim-operator-user",
    },
  },
  {
    "rktjmp/lush.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function() require("plugins.gruvbox") end,
  },
  {
    "hoob3rt/lualine.nvim",
    config = function() require("plugins.lualine") end,
  },
  {
    "crispgm/nvim-tabline",
    config = function() require("plugins.nvim-tabline") end,
  },
  {
    "vim-denops/denops.vim",
  },
  {
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
    "neovim/nvim-lspconfig",
    config = function() require("plugins.nvim-lspconfig") end,
    event = "BufRead",
  },
  {
    "rust-lang/rust.vim",
    config = function() require("plugins.rust") end,
    ft = {
      "rust",
    }
  },
  {
    "derekwyatt/vim-scala",
    ft = {
      "scala",
    }
  },
  {
    "evanleck/vim-svelte",
    ft = {
      "svelte",
    }
  },
  {
    "lepture/vim-velocity",
    ft = {
      "velocity",
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
  },
  {
    "numToStr/Comment.nvim",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  {
    "nabezokodaikon/translate.nvim",
  },
  {
    "phaazon/hop.nvim",
  },

  {
    "Shougo/ddc.vim",
    config = function() require("plugins.ddc") end,
  },
  {
    "Shougo/ddc-ui-native",
  },
  {
    "Shougo/ddc-matcher_head",
  },
  {
    "Shougo/ddc-sorter_rank",
  },
  {
    "Shougo/ddc-around",
  },
  {
    "Shougo/ddc-nvim-lsp",
  },
  {
    "LumaKernel/ddc-file",
  },

  {
    "Shougo/ddu.vim",
    config = function() require("plugins.ddu") end,
  },
  {
    "Shougo/ddu-commands.vim",
  },
  {
    "Shougo/ddu-ui-ff",
  },
  {
    "Shougo/ddu-ui-filer",
  },
  {
    "yuki-yano/ddu-filter-fzf",
  },
  {
    "Shougo/ddu-filter-matcher_relative",
  },
  {
    "Shougo/ddu-kind-file",
  },
  {
    "Shougo/ddu-source-file",
  },
  {
    "matsui54/ddu-source-file_external",
  },
  {
    "shun/ddu-source-buffer",
  },
  {
    "shun/ddu-source-rg",
  },
  {
    "Shougo/ddu-source-file_old",
  },
  {
    "Shougo/ddu-column-filename",
  },
  {
    "Shougo/ddu-filter-sorter_alpha",
  },
})

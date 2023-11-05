vim.cmd('syntax off')
vim.cmd('filetype off')
vim.cmd('filetype plugin indent off')


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
  },
  {
    "ellisonleao/gruvbox.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  {
    "hoob3rt/lualine.nvim",
  },
  {
    "crispgm/nvim-tabline",
  },
  {
    "kana/vim-operator-replace",
    dependencies = {
      "kana/vim-operator-user",
    },
  },
  {
    "mattn/emmet-vim",
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "rust-lang/rust.vim",
  },
  {
    "lepture/vim-velocity",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "numToStr/Comment.nvim",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
  {
    "nabezokodaikon/translate.nvim",
  },
  {
    "phaazon/hop.nvim",
  },
  {
    "Shougo/ddc.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc-ui-native",
      "Shougo/ddc-matcher_head",
      "Shougo/ddc-sorter_rank",
      "Shougo/ddc-around",
      "Shougo/ddc-nvim-lsp",
      "LumaKernel/ddc-file",
    },
  },
  {
    "Shougo/ddu.vim",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddu-ui-ff",
      "Shougo/ddu-ui-filer",
      "yuki-yano/ddu-filter-fzf",
      "Shougo/ddu-filter-matcher_relative",
      "Shougo/ddu-kind-file",
      "Shougo/ddu-source-file",
      "matsui54/ddu-source-file_external",
      "shun/ddu-source-buffer",
      "shun/ddu-source-rg",
      "Shougo/ddu-source-file_old",
      "Shougo/ddu-column-filename",
      "Shougo/ddu-filter-sorter_alpha",
    },
  },
  {
    "Shougo/ddu-commands.vim",
    dependencies = {
      "Shougo/ddu.vim",
    },
  },
})


vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin indent on')


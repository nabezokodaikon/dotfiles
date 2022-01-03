local fn = vim.fn

-- ~/.local/share/nvim/
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path
  }
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()

  -- Plugin manager
  use { 'wbthomason/packer.nvim' }

  -- テキストを囲ったり、囲いを外したりする。
  use { 'tpope/vim-surround' }

  -- アイコン。
  use { 'kyazdani42/nvim-web-devicons' }

  -- コメントアウト。
  use {
    'scrooloose/nerdcommenter',
    config = function() require('plugins.nerdcommenter') end
  }

  -- ユーザが自由にサブモードを定義できる。
  use {
    'kana/vim-submode',
    config = function() require('plugins.vim-submode') end
  }

  -- カーソル移動を便利にする。
  use {
    'easymotion/vim-easymotion',
    config = function() require('plugins.vim-easymotion') end
  }

  -- AIによる補完候補を表示。

  use {
    'github/copilot.vim',
    config = function() require('plugins.copilot') end
  }

  -- Color scheme
  use { 'rktjmp/lush.nvim' }

  use {
    'ellisonleao/gruvbox.nvim',
    requires = 'rktjmp/lush.nvim',
    config = function() require('plugins.gruvbox') end
  }

  -- Status line
  use {
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins.telescope') end
  }

  -- Emmet
  use {
    'mattn/emmet-vim',
    config = function() require('plugins.emmet-vim') end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.nvim-lspconfig') end,
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.nvim-cmp') end,
  }

  use { 'hrsh7th/cmp-buffer', requires = { 'hrsh7th/nvim-cmp', 'neovim/nvim-lspconfig' } }
  use { 'hrsh7th/cmp-path', requires = 'hrsh7th/nvim-cmp', }
  use { 'hrsh7th/cmp-nvim-lsp', requires = 'hrsh7th/nvim-cmp', }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins.nvim-treesitter') end,
  }

  use {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    setup = function() require('plugins.symbols-outline') end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    require = { 'kyazdani42/nvim-web-devicons' },
    cmd = 'NvimTreeToggle',
    config = function() require('plugins.nvim-tree') end,
  }

  -- Scala syntax
  use {
    'derekwyatt/vim-scala',
    ft = { 'scala' },
  }

  -- Vim configuration for Rust
  use {
    'rust-lang/rust.vim',
    ft = { 'rust' },
    config = function() require('plugins.rust') end,
  }

  use {
    'lepture/vim-velocity',
    ft = { 'velocity' }
  }

  -- 日本語、英語の相互翻訳。
  use {
    'nabezokodaikon/jaen-translate.vim',
    cmd = { 'TranslateJa2En', 'TranslateEn2Ja' },
  }

  -- タブラインをカスタマイズ。
  use {
    'nabezokodaikon/tabline.vim',
    event = { 'BufEnter' },
    config = function() require('plugins.tabline') end,
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

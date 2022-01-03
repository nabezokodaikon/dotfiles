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
  use 'wbthomason/packer.nvim'

  -- テキストを囲ったり、囲いを外したりする。
  use 'tpope/vim-surround'

  -- アイコン。
  use { 'kyazdani42/nvim-web-devicons' }

  -- コメントアウト。
  use {
    'scrooloose/nerdcommenter',
    config = function()
      vim.g.NERDSpaceDelims = 1
    end
  }

  -- ユーザが自由にサブモードを定義できる。
  use {
    'kana/vim-submode',
    config = function()
      vim.cmd [[
        " Window resize.
        call submode#enter_with('window-resize', 'n', '', '<C-w>>', '<C-w>>')
        call submode#enter_with('window-resize', 'n', '', '<C-w><', '<C-w><')
        call submode#enter_with('window-resize', 'n', '', '<C-w>+', '<C-w>+')
        call submode#enter_with('window-resize', 'n', '', '<C-w>-', '<C-w>-')
        call submode#map('window-resize', 'n', '', '>', '<C-w>>')
        call submode#map('window-resize', 'n', '', '<', '<C-w><')
        call submode#map('window-resize', 'n', '', '+', '<C-w>+')
        call submode#map('window-resize', 'n', '', '-', '<C-w>-')

        " Tab change.
        call submode#enter_with('tab-next', 'n', '', 'gt', 'gt')
        call submode#map('tab-next', 'n', '', 't', 'gt')
        call submode#enter_with('tab-preview', 'n', '', 'gT', 'gT')
        call submode#map('tab-preview', 'n', '', 'T', 'gT')
      ]]
    end
  }

  -- カーソル移動を便利にする。
  use {
    'easymotion/vim-easymotion',
    config = function()
      -- デフォルトのキーマッピングを無効化。
      vim.g.EasyMotion_do_mapping = 0
      -- 検索後、Enterでカーソル位置に一番近いマッチした箇所に移動する。
      vim.g.EasyMotion_enter_jump_first = 1
      -- 大文字、小文字を区別しない。
      vim.g.EasyMotion_smartcase = 1
      -- キーワードの入力を2文字まで受け付ける。
    end
  }

  -- AIによる補完候補を表示。

  use {
    'github/copilot.vim',
    config = function()
      vim.g.copilot_no_tab_map = true
    end
  }

  -- Color scheme
  use { 'rktjmp/lush.nvim' }

  use {
    'ellisonleao/gruvbox.nvim',
    requires = 'rktjmp/lush.nvim',
    config = function()
      vim.o.background = 'dark'
      vim.cmd [[colorscheme gruvbox]]
    end
  }

  -- Status line
  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require('plugins.lualine')
    end
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('plugins.telescope')
    end
  }

  -- Emmet
  use {
    'mattn/emmet-vim',
    ft = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', },
    config = function()
      vim.g.user_emmet_install_global = 0
      vim.g.user_emmet_leader_key = '<C-e>'
      vim.cmd [[
        augroup emmet_my_settings
            autocmd!
            autocmd FileType
            \ html,css,scss,javascript,javascriptreact,typescript,typescriptreact
            \ EmmetInstall
        augroup END
      ]]
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.nvim-lspconfig')
    end
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
    opt = true,
    cmd = 'SymbolsOutline',
    setup = function() require('plugins.symbols-outline') end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    opt = true,
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
    config = function()
      vim.g.rustfmt_command = 'rustfmt'
      vim.g.rustfmt_autosave = 1
    end,
  }

  use {
    'lepture/vim-velocity',
    ft = { 'velocity' }
  }

  use {
    'nabezokodaikon/jaen-translate.vim',
    opt = true,
    cmd = { 'TranslateJa2En', 'TranslateEn2Ja' },
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)

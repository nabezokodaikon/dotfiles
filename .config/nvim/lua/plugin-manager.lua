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
      vim.api.nvim_set_keymap('n', 'co', '<Plug>NERDCommenterToggle', { noremap = false }) 
      vim.api.nvim_set_keymap('v', 'co', '<Plug>NERDCommenterToggle', { noremap = false }) 
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
      vim.api.nvim_set_keymap('n', '<Leader>m', '<Plug>(easymotion-overwin-f2)', { noremap = false }) 
    end
  }

  -- AIによる補完候補を表示。
  use {
    'github/copilot.vim',
    config = function()
      vim.api.nvim_set_keymap(
        'i',
        '<C-J>',
        [[copilot#Accept("\<CR>")]],
        { silent = true, script = true, expr = true }) 
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
      require'status-line'
    end
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require'fuzzy-finder'
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
      require('lsp')
      require('virtual-text')
    end
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('completion') end,
  }

  use { 'hrsh7th/cmp-buffer', opt = true, requires = { 'hrsh7th/nvim-cmp', 'neovim/nvim-lspconfig' } }
  use { 'hrsh7th/cmp-path', opt = true, requires = 'hrsh7th/nvim-cmp', }
  use { 'hrsh7th/cmp-nvim-lsp', opt = true, equires = 'hrsh7th/nvim-cmp', }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  vim.api.nvim_set_keymap('n', '<Leader>o', '<cmd>SymbolsOutline<CR>', { noremap = true, silent = true }) 
 use {
   'simrat39/symbols-outline.nvim',
   opt = true,
   cmd = 'SymbolsOutline',
   setup = function() require('out-line') end
 }

  vim.api.nvim_set_keymap('n', '<Leader>e', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true }) 
  use {
    'kyazdani42/nvim-tree.lua',
    require = { 'kyazdani42/nvim-web-devicons' },
    cmd = 'NvimTreeToggle',
    config = function() require('tree') end,
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

    vim.api.nvim_set_keymap('v', '<Leader>t', '<cmd>TranslateJa2En<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<Leader>j', '<cmd>TranslateEn2Ja<CR>', { noremap = true, silent = true })
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

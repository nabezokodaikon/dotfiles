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

return require('packer').startup(function(use)

  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- テキストを囲ったり、囲いを外したりする。
  use 'tpope/vim-surround'

  -- コメントアウト。
  use {
    'scrooloose/nerdcommenter',
    config = function()
      vim.cmd [[let g:NERDSpaceDelims = 1]]
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
      vim.cmd [[
        " デフォルトのキーマッピングを無効化。
        let g:EasyMotion_do_mapping = 0
        " 検索後、Enterでカーソル位置に一番近いマッチした箇所に移動する。
        let g:EasyMotion_enter_jump_first = 1
        " 大文字、小文字を区別しない。
        let g:EasyMotion_smartcase = 1
      ]]
      -- キーワードの入力を2文字まで受け付ける。
      vim.api.nvim_set_keymap('n', '<Leader>m', '<Plug>(easymotion-overwin-f2)', { noremap = false }) 
    end
  }

  -- AIによる補完候補を表示。
  use {
    'github/copilot.vim',
    config = function()
      vim.cmd [[let g:copilot_no_tab_map = v:true]]
      vim.api.nvim_set_keymap(
        'i',
        '<C-j>',
        [[copilot#Accept("\<CR>")]],
        { noremap = false, silent = true, script = true, expr = true }) 
    end
  }

  -- Icon
  use 'kyazdani42/nvim-web-devicons'

  -- Color scheme
  use {
    'ellisonleao/gruvbox.nvim',
    requires = 'rktjmp/lush.nvim',
    config = function()
      vim.o.background = "dark"
      vim.cmd [[colorscheme gruvbox]]
    end
  }

  -- Status line
  use {
    'hoob3rt/lualine.nvim',
    config = function()
      require'status_line'
    end
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require'fuzzy_finder'
    end
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

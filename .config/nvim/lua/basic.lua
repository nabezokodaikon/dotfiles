--------------------------------
-- Basic settings
--------------------------------
function SetOptions()

  local opts = {
    -- 新しい行の自動インデントを有効化。
    autoindent = true,
    -- 外部で変更のあったファイルを自動的に読みなおす。
    autoread = true,
    -- バックアップファイルを作成しない。
    backup = false,
    -- クリップボードと連携。
    clipboard = 'unnamedplus',
    -- ポップアップの動作。
    completeopt = 'menuone,noselect',
    -- 現在の列を強調する。
    cursorcolumn = true,
    -- 現在の行を強調する。
    cursorline = true,
    -- タブ入力を空白入力に置き換える。
    expandtab = true,
    -- カーソルを点滅させない。
    guicursor = "a:blinkon0",
    -- 保存されていないファイルがあるときでも別のファイルを開く。
    hidden = true,
    -- 検索結果をハイライトする。
    hlsearch = true,
    -- 文字列置換をインタラクティブに表示する。
    inccommand = 'split',
    -- インクリメンタル検索有効。
    incsearch = true,
    laststatus = 2,
    -- マウスを無効化。
    mouse = '',
    -- 行番号を表示する。
    number = true,
    -- ポップアップの行数。
    pumheight = 10,
    -- vim-airlineを使用するため、現在のモードを非表示にする。
    showmode = false,
    -- 常にタブラインを表示する。
    showtabline = 2,
    -- 常にsigncolumnを表示する。
    signcolumn = 'yes',
    -- 新しい行の高度な自動インデントを有効化。
    smartindent = true,
    -- shiftwidthの設定を有効化。
    smarttab = true,
    -- タブ入力で挿入される空白の長さをshiftwidthと同じにする。
    softtabstop = -1,
    -- スワップファイルを作成しない。
    swapfile = false,
    -- ターミナルでもTrueColorを利用できるようにします。
    termguicolors = true,
    -- 自動改行させない。
    textwidth = 0,
    -- 挿入モードへ戻るときの esc キーの反応を早くする。
    ttimeoutlen = 0,
    -- 行頭、行末の回り込みを許可。
    whichwrap='b,s,h,l,<,>,[,]',
  }

  for opt, val in pairs(opts) do
    vim.o[opt] = val
  end

end

SetOptions()

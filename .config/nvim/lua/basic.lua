--------------------------------
-- Basic settings
--------------------------------
-- 外部で変更のあったファイルを自動的に読みなおす。
vim.o.autoread = true
-- バックアップファイルを作成しない。
vim.o.backup = false
-- クリップボードと連携。
vim.o.clipboard = 'unnamedplus'
-- ポップアップの動作。
vim.o.completeopt = 'menuone,noselect'
-- 現在の列を強調する。
vim.o.cursorcolumn = true
-- 現在の行を強調する。
vim.o.cursorline = true
-- タブ入力を空白入力に置き換える。
vim.o.expandtab = true
-- カーソルを点滅させない。
vim.o.guicursor = "a:blinkon0"
-- 保存されていないファイルがあるときでも別のファイルを開く。
vim.o.hidden = true
-- 検索結果をハイライトする。
vim.o.lsearch = true
-- 文字列置換をインタラクティブに表示する。
vim.o.inccommand = 'split'
-- インクリメンタル検索有効。
vim.o.incsearch = true
vim.o.laststatus = 2
-- マウスを無効化。
vim.o.mouse = ''
-- 行番号を表示する。
vim.o.number = true
-- ポップアップの行数。
vim.o.pumheight = 10
-- vim-airlineを使用するため、現在のモードを非表示にする。
vim.o.showmode = false
-- 常にタブラインを表示する。
vim.o.showtabline = 2
-- 常にsigncolumnを表示する。
vim.o.signcolumn = 'yes'
-- 新しい行の高度な自動インデントを有効化。
-- vim.o.cindent = true
-- shiftwidthの設定を有効化。
vim.o.smarttab = true
-- タブ入力で挿入される空白の長さをshiftwidthと同じにする。
vim.o.softtabstop = -1
-- スワップファイルを作成しない。
vim.o.swapfile = false
-- ターミナルでもTrueColorを利用できるようにします。
vim.o.termguicolors = true
-- 自動改行させない。
vim.o.textwidth = 0
-- 挿入モードへ戻るときの esc キーの反応を早くする。
vim.o.ttimeoutlen = 0
-- 行頭、行末の回り込みを許可。
vim.o.whichwrap= 'b,s,h,l,<,>,[,]'

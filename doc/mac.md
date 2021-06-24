# Setup for Mac

## アプリケーション
### Google Chrome
### Google IME
### BetterTouchTool
#### ライセンス
`Googleドライブ/doc/license.bettertouchtool`
#### 設定
以下をインポートする。
`Googleドライブ/doc/bettertouchtool.bttpreset`
### Cleaner-App
App Storeからダウンロードする。
### 1Password
App Storeからダウンロードする。
### iTerm2
#### Colors
以下をインポートする。
`Googleドライブ/doc/iterm2.itermcolors`
色は`One Dark`を設定する。
#### Text
##### Font
以下をHomebrewからインストールする。
`Myrica M`
#### Terminal
##### Terminal Emulation
`xterm-256color`

## システム環境設定
### 一般
#### デフォルトブラウザ
Google Chrome
### セキュリティをプライバシー
#### ファイアウォール
ファイアウォールを有効にする。
### キーボード
#### 入力ソース
Google IMEのみにする。
### トラックパッド
#### 軌跡の速さ
最高速度にする。

## Homebrew
### rmtree
```bash
$ brew tap beeftornado/rmtree
```
### Formulae
* awscli
* deno
* fzf
* git
* luajit
  * `brew install luajit --HEAD`
* neovim
  * `brew install neovim --HEAD`
* node
* python@3.9
* reattach-to-user-namespace
  * [コピー・ペーストをtmux、iTerm2、OS Xで共有する](https://qiita.com/kiyodori/items/02eb88864f583db3e799)
* rust
* rust-analyzer
* tig
* tmux
* translate-shell
* tree
* zsh
### Casks
* font-myrica

## 音楽
Googleドライブで同期する。

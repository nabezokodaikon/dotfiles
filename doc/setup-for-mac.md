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
### AppCleaner 
[AppCleaner](https://freemacsoft.net/appcleaner/)
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
  * Mac標準のgitは`osxkeychain helper`が無いため使用しない。
* luajit
  * `brew install luajit --HEAD`
  * [macOs Catalina: Neovim from homebrew fails to start](https://github.com/neovim/neovim/issues/11411)
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

## Develop
### GitHub
#### Personal access tokens
`マイドライブ/dev/github/.git-credentials`
### AWS
#### アクセスキー (アクセスキー ID とシークレットアクセスキー)
`マイドライブ/dev/aws/.aws`

## Music
1. 以降の作業を完了するまで、iTunesを絶対に起動しないこと。
1. 既存の`~/Music/iTunes`と`~/Music/Music`ディレクトリを退避しておく。
1. `マイドライブ/music(iTuens)`内のディレクトリのシンボリックリンクを作成する。
  * `ln -s ~/Google\ ドライブ/music\(iTunes\)/iTunes ~/Music/iTunes`
  * `ln -s ~/Google\ ドライブ/music\(iTunes\)/Music ~/Music/Music`

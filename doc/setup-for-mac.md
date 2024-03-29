# Setup for Mac

## アプリケーション
### Google Chrome
### Google IME
### BetterTouchTool
#### ライセンス
`マイドライブ/doc/license.bettertouchtool`
#### 設定
以下をインポートする。
`マイドライブ/doc/bettertouchtool.bttpreset`
### AppCleaner 
[AppCleaner](https://freemacsoft.net/appcleaner/)
### Tenorshare iCareFone
[Tenorshare iCareFone](https://www.tenorshare.jp/products/icarefone.html)
### 1Password
App Storeからダウンロードする。
### iTerm2
#### Colors
以下をインポートする。
`マイドライブ/doc/iterm2.itermcolors`
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
### Homebrew
```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/nabezokodaikon/.zprofile
```
### rmtree
```bash
$ brew tap beeftornado/rmtree
```
### Formulae
* awscli
* deno
* fd
* fzf
* git
  * Mac標準のgitは`osxkeychain helper`が無いため使用しない。
* neovim
  * `brew install neovim --HEAD`
* node
* reattach-to-user-namespace
  * [コピー・ペーストをtmux、iTerm2、OS Xで共有する](https://qiita.com/kiyodori/items/02eb88864f583db3e799)
* rg
* rust-analyzer
* tig
* tmux
* translate-shell
* tree
* coreutils
* yarn
* zsh
  * デフォルトのログインシェルから変更する。
  * システム環境設定 -> ユーザとグループ -> 左下の鍵 -> ユーザを右クリック「詳細オプション」
### Casks
#### Font
```
$ brew tap homebrew/cask-fonts
```
##### font-myrica
```
$ brew install font-myricam
```
##### font-hack-nerd-font (Non-ASCII Font)
```
$ brew install font-hack-nerd-font
```
### Other
#### JAVA
```
$ brew install openjdk
$ sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
$ echo 'export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"' >> ~/.zshrc
$ export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
```
### Neovim
Neovimのインストールに失敗した場合は、以下を実行後に再インストールしてみる。
* [macOs Catalina: Neovim from homebrew fails to start](https://github.com/neovim/neovim/issues/11411)
* [fix(treesitter): set match limit for query cursors](https://github.com/neovim/neovim/pull/14915)
```
$ brew uninstall --ignore-dependencies tree-sitter && brew install tree-sitter --HEAD
$ brew uninstall --ignore-dependencies luajit --HEAD && brew install luajit --HEAD
```
### Rust
[Rustをインストール](https://www.rust-lang.org/ja/tools/install)
```
$ cargo install ripgrep
$ cargo install fd-find
```

## Develop
### GitHub
#### Personal access tokens
`マイドライブ/dev/github/.git-credentials`
### AWS
#### アクセスキー (アクセスキー ID とシークレットアクセスキー)
`マイドライブ/dev/aws/.aws`

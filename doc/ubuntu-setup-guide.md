# Ubuntu setup guide
## caps to ctrl
`/etc/defalt/keyboard`ファイルを以下のように書き変える。
```
XKBOPTIONS="ctrl:nocaps"
# 再起動
```

## 更新
### 自動更新無効化
`/etc/apt/apt.conf.d/20auto-upgrades`ファイルの以下の値を`0`にする。
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
# 再起動
```
#### Update
```
$ sudo apt update
$ sudo apt upgrade
# 再起動
```

## Install fcitx-mozc
### インストール
```
$ sudo apt install fcitx-mozc
# 再起動
```

### 設定
1. `地域と言語`の設定から、`インストールされている言語の管理`を選択。
1. `キーボード入力に使うIMシステム`を、`fcitx`に変更。
1. 再起動。
#### 入力メソッド
1. 右上のキーボードアイコンから`設定`を起動する。
1. 上から順に以下のようにする。
  1. キーボード-英語(US)
  1. Mozc
#### 全体の設定
1. `入力メソッドのオンオフ`に`Ctrl+Space`を設定する。
1. OSを再起動する。

### Install Chromium
#### 本体
Ubuntusソフトウェアからインストールする。
#### プラグイン
* Google翻訳
* Adblock Plus
* Tabs to the Front
* Save to Pocket

### Homebrew on Linux
#### インストール
[linuxbrew](https://docs.brew.sh/Homebrew-on-Linux)
```
$ sudo apt install build-essential curl file git
# 再起動

$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)
# 再起動

$ test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
$ test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
$ test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
$ echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
# 再起動
```
#### rmtree
```
$ brew tap beeftornado/rmtree
$ brew install brew-rmtree 
```

### homebrew-rmtree
```
$ brew tap beeftornado/rmtree
$ brew install beeftornado/rmtree/brew-rmtree
```

### ログインシェル変更
brew でインストールすると、ログインシェルに設定できない。
```
$ sudo apt install zsh
$ which zsh
$ chsh
# 再起動
```

### clipboard
```
$ sudo apt install xclip
# 再起動
```

### 開発ツールインストール
```
$ brew install git
# 再起動

$ brew install tig
$ brew install tmux
$ brew install autoconf
$ brew install automake
```

### dotfilesインストール

### Install neovim
#### Neovim
```
$ brew install neovim
```
#### python
```
$ brew install python3
$ pip3 install pynvim
$ pip3 install websocket-client sexpdata

$ brew install python2
$ pip2 install pynvim
```
#### node
```
$ brew install node
$ npm install --global neovim 
```
#### ripgrep
```
$ brew install ripgrep
# OR
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.1/ripgrep_11.0.1_amd64.deb
$ sudo dpkg -i ripgrep_11.0.1_amd64.deb
```
#### universal-ctags
```
$ git clone https://github.com/universal-ctags/ctags.git
$ cd ctags
$ ./autogen.sh 
$ ./configure
$ make
$ sudo make install
```
#### Translate
```
$ sudo apt install gawk
$ git clone https://github.com/soimort/translate-shell
$ cd translate-shell/
$ make
$ sudo make install
```

### Trouble shooting
#### "システムプログラムの問題が見つかりました"ダイアログが表示される場合
/var/crashに問題のあったアプリの情報を削除する。
```
$ sudo rm -rf /var/crash/*
```
#### Homebrewのキャッシュ削除
```
$ brew cleanup -s
```
#### brew upgradeでError: SHA1 mismatchが出た時の対処法
```
$ brew cleanup -s
$ brew update
```

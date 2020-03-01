# Ubuntu setup guide

## 更新
### 自動更新無効化
`/etc/apt/apt.conf.d/20auto-upgrades`ファイルの以下の値を`0`にする。
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Unattended-Upgrade "1";
# 再起動
```
### Update
```
$ sudo apt dist-upgrade
$ sudo apt update
$ sudo apt upgrade
# 再起動
```

## caps to ctrl
`/etc/defalt/keyboard`ファイルを以下のように書き変える。
```
XKBOPTIONS="ctrl:nocaps"
# 再起動
```

## Install fcitx-mozc
### インストール
```
$ sudo apt install fcitx-mozc
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


## Install Chromium
```
$ sudo apt install chromium-browser
```

## clipboard
```
$ sudo apt install xclip
# 再起動
```

## ログインシェル変更
brew でインストールすると、ログインシェルに設定できない。
```
$ sudo apt install zsh
$ which zsh
$ chsh
# 再起動
```

## Install Homebrew on Linux
### 本体
[Homebrew-on-Linux](https://docs.brew.sh/Homebrew-on-Linux)
```
$ sudo apt install build-essential curl file git

$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)

$ test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
$ test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
$ test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
$ echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
```
### rmtree
```
$ brew tap beeftornado/rmtree
$ brew install beeftornado/rmtree/brew-rmtree
```
### 開発ツールインストール
```
$ brew install tig
$ brew install tmux
```

## dotfileseンストール

## Install neovim
### Neovim
```
$ brew install neovim
```
### python
```
$ brew install python3
$ pip3 install pynvim

$ brew install python2
$ pip2 install pynvim
```
### node
```
$ brew install node
$ npm install --global neovim 
```
### ripgrep
```
$ brew install ripgrep
```
### universal-ctags
[universal-ctagsのUbuntu 18.04 LTS用debパッケージをビルドした](https://hnakamur.github.io/blog/2018/06/08/build-universal-ctags-deb-for-ubuntu-18.04-lts/)
```
$ sudo apt install software-properties-common
$ sudo add-apt-repository ppa:hnakamur/universal-ctags
$ sudo apt update
$ sudo apt install universal-ctags
```
### Translate
```
$ brew install translate-shell
```

## Trouble shooting
### "システムプログラムの問題が見つかりました"ダイアログが表示される場合
/var/crashに問題のあったアプリの情報を削除する。
```
$ sudo rm -rf /var/crash/*
```
### Homebrewのキャッシュ削除
```
$ brew cleanup -s
```
### brew upgradeでError: SHA1 mismatchが出た時の対処法
```
$ brew cleanup -s
$ brew update
```
### apt update が失敗する場合の対処法
[Ubuntu　E:Read error - read (5 Input/output error), E:The package lists or status file could not be parsed or opened.](http://kurumatorajirou.blogspot.com/2012_09_01_archive.html)
```
$ sudo rm /var/lib/dpkg/status
$ sudo cp /var/lib/dpkg/status-old /var/lib/dpkg/status
$ sudo rm -rf /var/lib/apt/lists/*
$ sudo dpkg --configure -a
$ sudo aptitude update
$ sudo aptitude upgrade
$ sudo aptitude install -f

# 上記で上手くいかないなら、下記を実行する。
$ sudo rm /var/lib/dpkg/status
$ sudo cp /var/lib/dpkg/status-old /var/lib/dpkg/status
$ sudo rm -rf /var/lib/apt/lists/*
$ sudo dpkg --configure -a
$ sudo apt-get update
$ sudo apt-get upgrade
$ sudo apt-get -f install
```

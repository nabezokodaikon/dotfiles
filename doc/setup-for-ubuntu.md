# Setup for Ubuntu

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

### ログインキーリング
[【Ubuntu18.04】ログインキーリングのパスワードを入力してください](https://ub.workdesign.jp/install/data1286.html)
1. **パスワードと鍵**アプリケーションを起動する。
2. **ログイン 項目**を右クリックし、**パスワードを変更**を選択する。
3. 現在のパスワードを入力する。
4. パスワードを**空白**で設定する。


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

## Git
[認証情報を永続的にほぞする](https://chaingng.github.io/post/git_save_pw/#credentialhelper%E3%81%AE%E4%BF%9D%E5%AD%98%E3%83%A2%E3%83%BC%E3%83%89)

## dotfileseンストール


## Install neovim
### Neovim
[Release](github.com/neovim/neovim/releases/)
```
$ ln -s ~/workspace/src/squashfs-root/usr/bin/nvim ~/.local/bin/nvim
```
### python
```
$ sudo apt install python3-pip
$ pip3 install pynvim
```
### node
```
& sudo apt install nodejs
& sudo apt install npm
```
### ripgrep
```
$ cargo install ripgrep
```
### Translate-shell
```
$ sudo apt install translate-shell
```
### rust-analyzer
```
$ sudo apt install curl
$ curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
$ sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
$ sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
$ sudo apt install apt-transport-https
$ sudo apt update
$ sudo apt install code
$ sudo apt install curl
$ git clone https://github.com/rust-analyzer/rust-analyzer
$ cd rust-analyzer
$ cargo xtask install
```

## Trouble shooting
### "システムプログラムの問題が見つかりました"ダイアログが表示される場合
/var/crashに問題のあったアプリの情報を削除する。
```
$ sudo rm -rf /var/crash/*
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

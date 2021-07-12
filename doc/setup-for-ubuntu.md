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
```bash
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

## 入力メソッド
`入力メソッドのオンオフ`に`Ctrl+Space`を設定する。

### ログインキーリング
[【Ubuntu18.04】ログインキーリングのパスワードを入力してください](https://ub.workdesign.jp/install/data1286.html)
1. **パスワードと鍵**アプリケーションを起動する。
2. **ログイン 項目**を右クリックし、**パスワードを変更**を選択する。
3. 現在のパスワードを入力する。
4. パスワードを**空白**で設定する。

## Install Google Chrome
### パッケージリストに追加
```bash
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
```
### 公開鍵を登録
```bash
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
```
### パッケージリストを更新
```bash
sudo apt update
```

## clipboard
```bash
$ sudo apt install xclip
# 再起動
```

## ログインシェル変更
```bash
$ sudo apt install zsh
$ which zsh
$ chsh
# 再起動
```

## Git
[認証情報を永続的に保存する](https://chaingng.github.io/post/git_save_pw/#credentialhelper%E3%81%AE%E4%BF%9D%E5%AD%98%E3%83%A2%E3%83%BC%E3%83%89)

## dotfilesインストール
```bash
$ cd ~/
$ git clone https://github.com/nabezokodaikon/dotfiles.git
$ sh ~/dotfiles/script/install.sh
$ sh ~/dotfiles/script/setup-git-config.sh
```

## Install neovim
### Neovim
```bash
$ cd ~/.local/src
$ git clone https://github.com/neovim/neovim.git
$ cd neovim
$ rm -rf build
$ make CMAKE_BUILD_TYPE=Release
$ sudo make install
$ ln -s ~/.local/src/neovim/build/bin/nvim ~/.local/bin/nvim
```
### node
```bash
& sudo apt install nodejs
& sudo apt install npm
```
### ripgrep
```bash
$ cargo install ripgrep
```
### Translate-shell
```bash
$ sudo apt install translate-shell
```
### rust-analyzer
```bash
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

## Terminal
### Font
* [プログラミング用フォント Myrica](https://myrica.estable.jp/)
```bash
$ sudo mkdir /usr/share/fonts/truetype/myrica
$ sudo cp ./MyricaM.TTC /usr/share/fonts/truetype/myrica/Myrica.TTC
$ fc-cache -fv
```
* [Ubuntu/Bold/complete](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Ubuntu/Bold/complete)
* [Ubuntu/Regular/complete/](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Ubuntu/Regular/complete)
### Color theme
[Gogh](https://github.com/Mayccoll/Gogh)

## Trouble shooting
### "システムプログラムの問題が見つかりました"ダイアログが表示される場合
/var/crashに問題のあったアプリの情報を削除する。
```bash
$ sudo rm -rf /var/crash/*
```
### apt update が失敗する場合の対処法
[Ubuntu　E:Read error - read (5 Input/output error), E:The package lists or status file could not be parsed or opened.](http://kurumatorajirou.blogspot.com/2012_09_01_archive.html)
```bash
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

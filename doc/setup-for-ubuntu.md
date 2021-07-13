# Setup for Ubuntu

## フォルダ名を英語に変更する
```bash
LANG=C xdg-user-dirs-gtk-update
```

## Dockにゴミ箱を表示する
```bash
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true 
```

## 自動更新無効化
```bash
sudo dpkg-reconfigure -p low unattended-upgrades
sudo apt install -y unattended-upgrades
```
上記コマンドで表示される画面で**いいえ**を選択する。

## caps to ctrl
`/etc/defalt/keyboard`ファイルを以下のように書き変える。
```
XKBOPTIONS="ctrl:nocaps"
```

## clipboard
```bash
sudo apt install xclip
```

## ログインシェル変更
```bash
sudo apt install zsh
which zsh
chsh
```

## Mozcプロパティ
IMEの切り替えに`Ctrl+Space`を設定する。

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
### インストール
```bash
sudo apt-get install google-chrome-stable
```

## ログインキーリング
[【Ubuntu18.04】ログインキーリングのパスワードを入力してください](https://ub.workdesign.jp/install/data1286.html)
1. **パスワードと鍵**アプリケーションを起動する。
2. **デフォルトのキーリング**を右クリックし、**パスワードを変更**を選択する。
3. 現在のパスワードを入力する。
4. パスワードを**空白**で設定する。

## Install dotfiles
```bash
cd ~/
git clone https://github.com/nabezokodaikon/dotfiles.git
sh ~/dotfiles/script/install.sh
sh ~/dotfiles/script/setup-git-config.sh
```

## Git
[認証情報を永続的に保存する](https://chaingng.github.io/post/git_save_pw/#credentialhelper%E3%81%AE%E4%BF%9D%E5%AD%98%E3%83%A2%E3%83%BC%E3%83%89)
1. 適当なgitリポジトリに移動する。`cd ~/dotfiles`
2. 一度pushして、認証情報を入力する。`git push origin master`
3. `~/.git-credentials`に認証情報を保存する。 `git config --global credential.helper store`
4. 次回ターミナル起動時から、認証情報を入力せずにgitの操作が行える。

## Install tmux
[From source tarball](https://github.com/tmux/tmux/wiki/Installing#from-source-tarball)
```bash
sudo apt install automake
sudo apt install make
sudo apt install gcc
sudo apt install libevent-dev
sudo apt install ncurses-dev
sudo apt install byacc
cd ~/.local/src
git clone https://github.com/tmux/tmux.git
cd tmux
./autogen.sh
./configure
make
sudo make install
ln -s ~/.local/src/tmux/tmux ~/.local/bin/tmux
```

## Install fzf
```bash
cd ~/.local/src
git clone --depth 1 https://github.com/junegunn/fzf.git
cd ~/fzf
./install
ln -s ~/.local/src/fzf/bin/fzf ~/.local/bin/fzf
```
tmuxを再起動すると、fzf-tmuxが使えるようになる。

## Install Neovim
* [Build prerequisites](https://github.com/neovim/neovim/wiki/Building-Neovim#ubuntu--debian)
* [Install from source](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source)
```bash
cd ~/.local/src
git clone https://github.com/neovim/neovim.git
cd neovim
rm -rf build
make CMAKE_BUILD_TYPE=Release
sudo make install
ln -s ~/.local/src/neovim/build/bin/nvim ~/.local/bin/nvim
```

## Install Rust
[get-started](https://www.rust-lang.org/ja/learn/get-started)
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```
### ripgrep
```bash
cargo install ripgrep
```
### rust-analyzer
[Building From Source](https://rust-analyzer.github.io/manual.html#building-from-source)
```bash
sudo apt install npm
cd ~/.local/src
git clone https://github.com/rust-analyzer/rust-analyzer.git
cd rust-analyzer
cargo xtask install
```

## Install Translate-shell
```bash
sudo apt install translate-shell
```

## デュアルブート時のLinuxとWindowsの時刻ズレを解消する
```bash
sudo timedatectl set-local-rtc true
```

## Windowsを自動選択でブートさせる方法
```bash
sudo vim /etc/default/grub
```
```
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.
# For full documentation of the options in this file, see:
#   info -f grub -n 'Simple configuration'

GRUB_DEFAULT=2 # <- 0 から 2 に変更する。
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=10
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_CMDLINE_LINUX=""
```
設定を反映させる。
```
sudo update-grub
```

## Customize Terminal
### Font
```bash
cd ~/.local/src
git clone https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh
```
`Googleドライブ/tool/myrica`をダウンロード
```
sudo mv myrica /usr/share/fonts/truetype/
fc-cache -fv
```
`MyricaM M Book`を選択する。
### Color theme
1. Terminalのプロファイル名を**英字**にする。
2. [Gogh](https://github.com/Mayccoll/Gogh)

## Trouble shooting
### "システムプログラムの問題が見つかりました"ダイアログが表示される場合
/var/crashに問題のあったアプリの情報を削除する。
```bash
sudo rm -rf /var/crash/*
```
### apt update が失敗する場合の対処法
[Ubuntu　E:Read error - read (5 Input/output error), E:The package lists or status file could not be parsed or opened.](http://kurumatorajirou.blogspot.com/2012_09_01_archive.html)
```bash
sudo rm /var/lib/dpkg/status
sudo cp /var/lib/dpkg/status-old /var/lib/dpkg/status
sudo rm -rf /var/lib/apt/lists/*
sudo dpkg --configure -a
sudo aptitude update
sudo aptitude upgrade
sudo aptitude install -f

# 上記で上手くいかないなら、下記を実行する。
sudo rm /var/lib/dpkg/status
sudo cp /var/lib/dpkg/status-old /var/lib/dpkg/status
sudo rm -rf /var/lib/apt/lists/*
sudo dpkg --configure -a
sudo apt-get update
sudo apt-get upgrade
sudo apt-get -f install
```

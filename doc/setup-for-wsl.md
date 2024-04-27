# WSL
## WSL2
### WSL2インストール
1. Windowsの機能の有効化または無効化で以下の項目にチェックを入れてWindowsを再起動する。
  * `Linux用Windowsサブシステム`
  * `仮想マシンプラットフォーム`
2. [x64 マシン用 WSL2 Linux カーネル更新プログラム パッケージ](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
をダウンロードし、インストールする。
3. コマンドプロンプトで`wsl --set-default-version 2`実行する。
4. MicrosoftStoreからUbuntuをインストールする。
5. Ubuntuを起動する。
6. Ubuntuのユーザー名とパスワードを設定する。

### Ubuntuの設定
1. アップデートし、再起動する。
```bash
$ sudo apt update
$ sudo apt upgrade
```
```batch
> wsl --shutdown
```

2. 必要なパッケージをインストールする。
```bash
$ sudo apt install -y \
  fontconfig \
  fzf \
  ripgrep \
  tig \
  tmux \
  tree \
  zsh
```

3. zshをログインシェルにする。
```
# zshのパスを確認する。
$ which zsh
/usr/bin/zsh
# 確認したパスを設定する。
$ chsh -s /usr/bin/zsh
```

4. クリップボードを連携する。
```bash
$ cd ~/.local/bin
$ wget https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
$ unzip win32yank-x64.zip
$ rm win32yank-x64.zip
```

5. フォントをインストールする。(WSL)
```bash
# NerdFonts
$ git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/.local/src/nerd-fonts
$ cd ~/.local/src/nerd-fonts
$ ./install.sh Hack

# HackGen_NF 
$ cd ~/.local/src
$ wget https://github.com/yuru7/HackGen/releases/download/v2.9.0/HackGen_NF_v2.9.0.zip
$ unzip HackGen_NF_v2.9.0.zip
$ sudo mkdir /usr/share/fonts/truetype/hack_gen_console_nf
$ sudo mv HackGenConsoleNF-Regular.ttf /usr/share/fonts/truetype/hack_gen_console_nf/

# システムが認識しているフォント一覧を更新。
$ sudo fc-cache -fv
```

6. フォントをインストールする。(Windows)
* [Hack Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Hack.zip)
* [HackGen](https://github.com/yuru7/HackGen/releases)
* フォントのインストール後WSLのフォントを変更しておく。

7. tigをインストールする。
`sudo apt install -y tig`だと日本語が文字化けしてしまうため、ソースコードからインストールする。
```bash
$ git clone https://github.com/jonas/tig.git ~/.local/src/tig
$ cd ~/.local/src/tig 
$ make configure
$ ./configure
$ make
$ make install
$ ln -s ${HOME}/.local/src/tig/src/tig ${HOME}/.local/bin/tig
```

8. neovimをインストールする。
```bash
$ sudo apt install -y ninja-build gettext cmake unzip curl build-essential
$ git clone https://github.com/neovim/neovim ~/.local/src/neovim
$ cd ~/src/neovim
$ make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/build/neovim"
$ make install
$ ln -s ${HOME}/.local/build/neovim/bin/nvim ${HOME}/.local/bin/nvim
```

9. dotfilesをインストールする。
```bash
$ git clone https://github.com/nabezokodaikon/dotfiles.git ~/dotfiles
$ cd ~/dotfiles/script
$ ./install.sh
$ ./git-config.sh
```
設定を有効化するためにログアウト->ログインする。


10. 日本語化
```bash
# 日本語言語パックのインストール
$ sudo apt -y install language-pack-ja

# ロケールを日本語に設定
$ sudo update-locale LANG=ja_JP.UTF8

# Ubuntuを再起動

# タイムゾーンをJSTに設定
# アジア -> Tokyo を選択
$ sudo dpkg-reconfigure tzdata

# 日本語マニュアルのインストール
$ sudo apt -y install manpages-ja manpages-ja-dev
```


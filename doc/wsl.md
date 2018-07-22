## WSL Ubuntu

### Color scheme
1. [Introducing the Windows Console Colortool](https://blogs.msdn.microsoft.com/commandline/2017/08/11/introducing-the-windows-console-colortool/)をダウンロードする。
1. 解凍したディレクトリ`colortool`へ移動する。
1. コマンドプロンプトで以下を実行する。
```
> colortool.exe OneHalfDark
```

### フォント
1. [Myrica](https://myrica.estable.jp/)をダウンロード & インストール。
1. ウィンドウのタイトルバーを`右クリック -> プロパティ -> フォント`で設定。

### 更新
```
$ apt update
$ apt upgrade
```

### 日本語化
```
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

### `git`インストール
```
$ sudo apt install git
```

### `dotfiles`インストール
```
$ cd ~/
$ git clone https://github.com/nabezokodaikon/dotfiles.git
$ cd dotfiles/script
$ ./install.sh
$ ./git-config.sh
```
TODO: `XDG_CONFIG_HOME`の有無を確認する。

### ログインシェルを`zsh`に変更
1. `zsh`インストール。
```
$ sudo apt install zsh
```

2. `zsh`のパスを確認する。
```
$ which zsh
/usr/bin/zsh
```

3. 確認したパスを設定する。
```
$ chsh -s /usr/bin/zsh
```

### `neovim`インストール
```
$ sudo apt install software-properties-common
$ sudo apt install python-software-properties
$ sudo apt-add-repository ppa:neovim-ppa/stable
$ sudo apt update
$ sudo apt install neovim
$ sudo apt install python-dev python-pip python3-dev python3-pip

$ pip install --upgrade pip
$ pip install --user neovim
$ export LC_ALL=C
$ pip install --upgrade pip
$ pip3 install --user neovim
```

### `ripgrep`インストール
```
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
$ sudo dpkg -i ripgrep_0.8.1_amd64.deb
```

### `Universal Ctags`インストール
```
$ sudo apt install autoconf
$ sudo apt install pkg-config

$ git clone https://github.com/universal-ctags/ctags.git
$ cd ctags
$ ./autogen.sh 
$ ./configure
$ make
$ sudo make install
```

### `tig`インストール
```
$ sudo apt install tig
```

### `tmux`インストール
```
$ sudo apt install tmux
```
TODO:
```
/home/nabezokodaikon/dotfiles/tmux/color.conf:24: unknown option: pane-border-status
/home/nabezokodaikon/dotfiles/tmux/color.conf:25: unknown option: pane-border-format
```

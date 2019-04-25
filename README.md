# dotfiles
## Install
```
# Clone from GitHub.
$ cd ~
$ git clone https://github.com/nabezokodaikon/dotfiles.git ~/dotfiles
$ cd ~/dotfiles/script

# Run install script.
$ ./install.sh

# Run Git setting script.
$ ./git-config.sh
```

## Windows
### Terminal
[wsl-terminal](https://goreliu.github.io/wsl-terminal/)


## Mac
### Homebrew
#### Hyper
```
$ brew cask install hyper
```
#### Java
```
$ brew cask install java
```
#### formula
```
$ brew install \
    git \
    giter8 \
    neovim \
    python3 \
    reattach-to-user-namespace \
    ripgrep \
    sbt \
    tig \
    tmux \
    tree \
    zsh
```
#### Universal Ctags
```
$ brew tap universal-ctags/universal-ctags
$ brew install --HEAD universal-ctags
```
#### Font
```
$ brew tap caskroom/fonts 
$ brew cask install font-myrica
```
#### homebrew-rmtree
```
$ brew tap beeftornado/rmtree
```

### Clipboard
* 既存の`pbcopy`と`pbpaste`を使用するため、別途インストールは不要。


### Neovim
```
$ pip2 install neovim
$ pip3 install neovim

# Neovimで以下のコマンドを実行する。
:UpdateRemotePlugins
```
#### coc.nvim
```
$ brew install yarn

# Neovimで以下のコマンドを実行する。
:CocInstall coc-json # For Haxe
:CocInstall coc-rls # For Rust
```
#### Haxe
Haxe4の最新版(Nightly Builds)をインストールする。
```
$ git clone https://github.com/vshaxe/haxe-language-server.git --recursive
$ cd haxe-languageserver

# 上記リポジトリの.travis.ymlに記述してあるコマンドを実行する。
$ haxelib git vshaxe-build https://github.com/vshaxe/vshaxe-build
$ haxelib run vshaxe-build -t language-server -t language-server-tests -m both
# haxe-languageserver/bin/server.js が生成されていることを確認する。

# coc-settings.jsonに生成されたserver.jsのパスを記述する。

# Neovimで以下のコマンドを実行する。
:CocInstall coc-json # For Haxe
```



### Translate Shell
[Translate Shell](https://github.com/soimort/translate-shell)
```
$ brew install gawk
$ git clone https://github.com/soimort/translate-shell.git
$ make
$ make install
```


## Arch Linux
### Neovim
```
$ apacman -S --noconfirm python-pip 
$ pip install --user neovim
```

### grep
grepには`ripgrep`を使用する。
* [ripgrep](https://github.com/BurntSushi/ripgrep)

### tmux
#### Clipboard
* `xclip`を使用するため、別途xclipをインストールする。

### Ctags
本家の`Ctags`は2009年以降更新が途絶えているため、`Universal Ctags`を使用する。
* [Universal Ctags](https://github.com/universal-ctags/ctags)


## MEMO
### Zshの設定ファイルの読み込み順序
1. Case by login shell.
  1. ~/.zshenv
  1. ~/.zprofile
  1. ~/.zshrc
  1. ~/.zslogin
  1. ~/.zlogout
1. Case by interactive shell.
  1. ~/.zshenv
  1. ~/.zshrc
1. Case by running shell script.
  1. ~/.zshenv

>Reference
* [zshの設定ファイルの読み込み順序と使い方Tipsまとめ](http://qiita.com/muran001/items/7b104d33f5ea3f75353f)

### Color
* [Bash tips: Colors and formatting](http://misc.flogisoft.com/bash/tip_colors_and_formatting)


## TODO

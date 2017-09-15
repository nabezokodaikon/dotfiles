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


## Mac
### Homebrew
  * git
  * giter8
  * neovim
  * nvm
  * python3
  * reattach-to-user-namespace
  * ripgrep
  * sbt
  * tig
  * tmux
  * tree
  * universal-ctags
  * zsh
#### Font
```
$ brew tap caskroom/fonts 
$ brew cask install font-myrica
```

### Clipboard
* 既存の`pbcopy`と`pbpaste`を使用するため、別途インストールは不要。


### Neovim
```
$ pip3 install neovim
$ nvim

# Neovimで以下のコマンドを実行する。
:UpdateRemotePlugins
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

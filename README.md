# dotfiles
## How to Install
```
# Clone from GitHub.
$ git clone https://github.com/nabezokodaikon/dotfiles.git ~/dotfiles
$ cd ~/dotfiles

# Run install script.
$ ./install.sh

# Run Git setting script.
$ ./git-config.sh
```


## Tools
### Neovim
#### Arch Linux
```
$ apacman -S --noconfirm python-pip 
$ pip install --user neovim
```

### tmux
#### How to use Clipboard
* linuxでは`xclip`を使用するため、別途xclipをインストールする。
* macでは既存の`pbcopy`と`pbpaste`を使用するため、別途インストールは不要。

### Karabiner
#### Mac
>2016/10/07の時点ではmacOS Sierraに対応していないため、以下の操作はできない。

Vim で挿入モードから抜ける時に英数入力に切り替える。
```
$ cd ./mac/karabiner
$ ./reset.sh
$ ./import.sh
$ cp ~/dotfiles/KeyRemap4MacBook-private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml
$ cp ~/dotfiles/mac/karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml
```


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

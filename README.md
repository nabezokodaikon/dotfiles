# dotfiles

## Install
```
$ git clone https://github.com/nabezokodaikon/dotfiles.git ~/dotfiles
$ cd ~/dotfiles/script
$ ./install.sh
$ ./git-config.sh
```

## SKK
### データベース
```
~/.cache/skkeleton.db
```
### 辞書
```
~/.local/share/skk/SKK-JISYO.L
```

## Translate Shell
Neovimで必要
```
$ git clone https://github.com/soimort/translate-shell.git ~/.local/src/translate-shell
$ cd ~/.local/src/translate-shell
$ make
$ ln -s ~/.local/src/translate-shell/build/trans ~/.local/bin/trans
```

## MEMO
### Zshの設定ファイルの読み込み順序
1. Case by login shell.
  1. `~/.zshenv`
  1. `~/.zprofile`
  1. `~/.zshrc`
  1. `~/.zslogin`
  1. `~/.zlogout`
1. Case by interactive shell.
  1. `~/.zshenv`
  1. `~/.zshrc`
1. Case by running shell script.
  1. `~/.zshenv`
#### 参考
* [zshの設定ファイルの読み込み順序と使い方Tipsまとめ](http://qiita.com/muran001/items/7b104d33f5ea3f75353f)


# 導入手順

## TODO
* split.rc.vimのsubmodeは、プラグインに依存している。
* tab.rc.vimのsubmodeは、プラグインに依存している。
* vim-gista-uniteを削除し、gistaのキーマッピングを指定する。
* unite.vimを削除する。

## dotfiles クローン
```
$ git clone https://github.com/nabezokodaikon/dotfiles.git ~/dotfiles
$ cd ~/dotfiles
```

## Git
```
$ ./git-config.sh
```

## シンボリックリンク作成
```
$ ./install.sh
```

## Neovim
### Arch Linux
```
$ yaourt -S --noconfirm python-pip 
$ pip install --user neovim
```

## tmux
### クリップボード
* linuxでは`xclip`を使用するため、別途xclipをインストールする。
* macでは既存の`pbcopy`と`pbpaste`を使用するため、別途インストールは不要。

## Mac
### Karabiner
>2016/10/07の時点ではmacOS Sierraに対応していないため、以下の操作はできない。

Vim で挿入モードから抜ける時に英数入力に切り替える。
```
$ cd ./mac/karabiner
$ ./reset.sh
$ ./import.sh
$ cp ~/dotfiles/KeyRemap4MacBook-private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml
$ cp ~/dotfiles/mac/karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml
```

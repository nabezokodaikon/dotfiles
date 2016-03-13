# 導入手順

## dotfiles クローン
```
$ git clone https://github.com/nabezokodaikon/dotfiles.git ~/dotfiles
```

## git
グローバル設定。
```
$ ./git-config.sh
```

## シンボリックリンク作成
```
$ ./install.sh
```

## vim
```
# NeoBundle 導入
$ ./neobundle-install.sh

# vim プラグイン導入
$ vim
:NeoBundleInstall
```

## neovim
### archlinux
```
$ yaourt -S python-pip --noconfirm
$ sudo pip3 install neovim
```

## Mac 固有設定
### KeyRemap4MacBook 設定ファイル配置
Vim で挿入モードから抜ける時に英数入力に切り替える。
```
$ cp ~/dotfiles/KeyRemap4MacBook-private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml
```

### tmux クリップボード
```
$ git clone https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
$ cd tmux-MacOSX-pasteboard
$ make reattach-to-user-namespace
$ cp reattach-to-user-namespace /usr/local/bin/
```

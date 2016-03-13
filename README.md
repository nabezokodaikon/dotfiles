# 導入手順

1. ホームディレクトリにリポジトリをクローンする
```
$ git clone https://github.com/nabezokodaikon/dotfiles.git ~/dotfiles
```

2. シンボリックリンクを作成する
```
$ ./install.sh
```

3. KeyRemap4MacBook 設定ファイル配置
```
# Vim で挿入モードから抜ける時に英数入力に切り替える
$ cp ~/dotfiles/KeyRemap4MacBook-private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml
```

4. Mac + tmux クリップボード
```
$ git clone https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
$ cd tmux-MacOSX-pasteboard
$ make reattach-to-user-namespace
$ cp reattach-to-user-namespace /usr/local/bin/
```

5. NeoBundle 導入
```
$ git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
```

6. vim プラグイン導入
```
$ vim
:NeoBundleInstall
```

7. neovim
```
$ yaourt -S python-pip --noconfirm
$ sudo pip3 install neovim
```


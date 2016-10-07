#!/bin/bash

# 各種設定ファイルのシンボリックリンクを削除します。
unlink $HOME/.zshrc
unlink $HOME/.vimrc
unlink $HOME/.tmux.conf
unlink $HOME/.ctags
unlink $HOME/.sbtconfig
unlink $HOME/.tigrc
unlink $HOME/.config/nvim
unlink $HOME/.config/termite

# 各種設定ファイルのシンボリックリンクを作成します。
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.ctags $HOME/.ctags
ln -s $HOME/dotfiles/.sbtconfig $HOME/.sbtconfig
ln -s $HOME/dotfiles/.tigrc $HOME/.tigrc
ln -s $HOME/dotfiles/.config/nvim/ $HOME/.config/nvim
ln -s $HOME/dotfiles/.config/termite/ $HOME/.config/termite

exit 0

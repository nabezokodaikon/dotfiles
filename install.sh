#!/bin/bash

# 各種設定ファイルのシンボリックリンクを作成します。
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.ctags $HOME/.ctags
ln -s $HOME/dotfiles/.sbtconfig $HOME/.sbtconfig
ln -s $HOME/dotfiles/.tigrc $HOME/.tigrc
ln -s $HOME/dotfiles/.config/nvim/ $HOME/.config/nvim

exit 0

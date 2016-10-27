#!/bin/bash

# 各種設定ファイルのシンボリックリンクを削除します。
unlink $HOME/.zshrc
unlink $HOME/.vimrc
unlink $HOME/.tmux.conf
unlink $HOME/.ctags
unlink $HOME/.tigrc
unlink $HOME/.config/nvim
unlink $HOME/.config/termite

if [ $(echo ${OSTYPE} | grep -e 'linux*') ]; then
    # Linux
    unlink $HOME/.xprofile
    unlink $HOME/.Xmodmap
fi

if [ -d ${HOME}/.sbt/0.13/plugins ]; then
    rm -rf $HOME/.sbt/0.13/plugins
fi

# 各種設定ファイルのシンボリックリンクを作成します。
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.ctags $HOME/.ctags
ln -s $HOME/dotfiles/.tigrc $HOME/.tigrc
ln -s $HOME/dotfiles/.config/nvim/ $HOME/.config/nvim
ln -s $HOME/dotfiles/.config/termite/ $HOME/.config/termite

if [ $(echo ${OSTYPE} | grep -e 'linux*') ]; then
    # Linux
    ln -s $HOME/dotfiles/xprofile/.xprofile $HOME/.xprofile
    ln -s $HOME/dotfiles/xprofile/.Xmodmap $HOME/.Xmodmap
fi

if [ ! -d ${HOME}/.sbt/0.13/plugins ]; then
    mkdir -p $HOME/.sbt/0.13/plugins
    ln -s $HOME/dotfiles/.sbt/0.13/plugins/build.sbt $HOME/.sbt/0.13/plugins/build.sbt
fi

exit 0

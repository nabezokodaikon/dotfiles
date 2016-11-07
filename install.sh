#!/bin/bash

# Uninstall
#--------------------------------
unlink ${HOME}/.zshenv
unlink ${HOME}/.zprofile
unlink ${HOME}/.zshrc
unlink ${HOME}/.zlogin
unlink ${HOME}/.zlogout
unlink ${HOME}/.tmux.conf
unlink ${HOME}/.tigrc
unlink ${HOME}/.ctags
unlink ${HOME}/.vimrc
unlink ${HOME}/.config/nvim
unlink ${HOME}/.config/termite
unlink ${HOME}/.sbt/0.13/plugins/build.sbt
unlink ${HOME}/.xprofile
unlink ${HOME}/.Xmodmap


# Install
#--------------------------------
if [ ! -d "${HOME}/.config" ]; then
    mkdir -pv ${HOME}/.config
fi

if [ ! -d "${HOME}/.sbt/0.13/plugins" ]; then
    mkdir -pv ${HOME}/.sbt/0.13/plugins
fi

ln -s ${HOME}/dotfiles/zsh/.zshenv ${HOME}/.zshenv
ln -s ${HOME}/dotfiles/zsh/.zprofile ${HOME}/.zprofile
ln -s ${HOME}/dotfiles/zsh/.zshrc ${HOME}/.zshrc
ln -s ${HOME}/dotfiles/zsh/.zlogin ${HOME}/.zlogin
ln -s ${HOME}/dotfiles/zsh/.zlogout ${HOME}/.zlogout
ln -s ${HOME}/dotfiles/tmux/.tmux.conf ${HOME}/.tmux.conf
ln -s ${HOME}/dotfiles/tig/.tigrc ${HOME}/.tigrc
ln -s ${HOME}/dotfiles/vim/.vimrc ${HOME}/.vimrc
ln -s ${HOME}/dotfiles/.ctags ${HOME}/.ctags
ln -s ${HOME}/dotfiles/.config/nvim/ ${HOME}/.config/nvim
ln -s ${HOME}/dotfiles/.config/termite/ ${HOME}/.config/termite
ln -s ${HOME}/dotfiles/.sbt/0.13/plugins/build.sbt ${HOME}/.sbt/0.13/plugins/build.sbt

if [ $(echo ${OSTYPE} | grep -e 'linux*') ]; then
    # For Linux only.
    ln -s ${HOME}/dotfiles/xprofile/.xprofile ${HOME}/.xprofile
    ln -s ${HOME}/dotfiles/xprofile/.Xmodmap ${HOME}/.Xmodmap
fi

if [ ! -d "$XDG_CONFIG_HOME/tmux/logs" ]; then
    mkdir -pv "$XDG_CONFIG_HOME/tmux/logs"
fi

if [ ! -d "$XDG_CONFIG_HOME/nvim/logs" ]; then
    mkdir -pv "$XDG_CONFIG_HOME/nvim/logs"
fi


exit 0

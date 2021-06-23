#--------------------------------
# Zsh .zshenv for common
#--------------------------------

# Japanese
#--------------------------------
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8


# Zsh history
#--------------------------------
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000


# Editor
#--------------------------------
type nvim > /dev/null 2>&1
if [ $? = 0 ]; then
    export EDITOR=nvim
else
    type vim > /dev/null 2>&1
    if [ $? = 0 ]; then
        export EDITOR=vim
    fi
fi


# Git
#--------------------------------
# 不明な証明書を許可する。
export GIT_SSL_NO_VERIFY=1


# Xdg
#--------------------------------
export XDG_CONFIG_HOME=$HOME/.config


# LUA
#--------------------------------
export LUA_PATH=~/.config/nvim

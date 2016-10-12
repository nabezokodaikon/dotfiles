#--------------------------------
# Linux の Zsh 設定 
#--------------------------------

# 環境変数
#--------------------------------
export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH

# zsh 使用時の term 設定
export TERM=screen-256color

# git
# 不明な証明書を許可する。
export GIT_SSL_NO_VERIFY=1

# java
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
export PATH=$JAVA_HOME/bin:$PATH

# scala
export SCALA_HOME=/usr/scala/default
export PATH=$SCALA_HOME/bin:$PATH


# ls
#--------------------------------
# カラー設定。
alias ls='ls --color=auto'


# keychain
#--------------------------------
type keychain > /dev/null 2>&1
if [ $? = 0 ]; then
    keychain $HOME/.ssh/sakuravps > /dev/null 2>/dev/null
    source $HOME/.keychain/$HOST-sh
fi


# Vim
#--------------------------------
type vim > /dev/null 2>&1
if [ $? = 0 ]; then
    alias vim="env LANG=ja_JP.UTF-8 $(which vim 2>/dev/null) \"\$@\""
fi


# Neovim
#--------------------------------
type nvim > /dev/null 2>&1
if [ $? = 0 ]; then
    alias nvim="env LANG=ja_JP.UTF-8 $(which nvim 2>/dev/null) \"\$@\""
fi


# Docker
#--------------------------------
type docker > /dev/null 2>&1
if [ $? = 0 ]; then
    alias dl='docker ps -l -q'
fi


# nvm
#--------------------------------
if [ -s "/usr/share/nvm/init-nvm.sh" ]; then
    # nvmの遅延読み込み。
    # 参考: http://broken-by.me/lazy-load-nvm/
    nvm() {
        unset -f nvm
        [ -s "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
        nvm "$@"
    }

    node() {
        unset -f node
        [ -s "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
        node "$@"
    }

    npm() {
        unset -f npm
        [ -s "/usr/share/nvm/init-nvm.sh" ] && source "/usr/share/nvm/init-nvm.sh"
        npm "$@"
    }
fi

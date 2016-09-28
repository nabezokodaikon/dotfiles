export PATH=/sbin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH

# zsh 使用時の term 設定
export TERM=screen-256color

# lsコマンドのカラー設定。
alias ls='ls --color=auto'

# java
export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
export PATH=$JAVA_HOME/bin:$PATH

# scala
export SCALA_HOME=/usr/scala/default
export PATH=$SCALA_HOME/bin:$PATH

# nvm
if [ -e '/usr/share/nvm/nvm.sh' ]; then
    echo 'nvm exists.'
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    source /usr/share/nvm/nvm.sh
    source /usr/share/nvm/bash_completion
    source /usr/share/nvm/install-nvm-exec
else
    echo 'nvm not exists.'
fi

# git
# 不明な証明書を許可する。
export GIT_SSL_NO_VERIFY=1

# sudo
alias sudo='sudo env PATH=$PATH'

# docker
alias dl='docker ps -l -q'

# vim
if [ -e '/usr/bin/vim' ]; then
    echo 'vim exists.'
    alias vim='env LANG=ja_JP.UTF-8 /usr/bin/vim "$@"'
elif [ -e "/usr/local/bin/vim" ]; then
    echo 'vim exists.'
    alias vim='env LANG=ja_JP.UTF-8 /usr/local/bin/vim "$@"'
else
    echo 'vim not exists.'
fi

# nvim
if [ -e '/usr/bin/nvim' ]; then
    echo 'neovim exists.'
    alias nvim='env LANG=ja_JP.UTF-8 /usr/bin/nvim "$@"'
elif [ -e "/usr/local/bin/nvim" ]; then
    echo 'neovim exists.'
    alias nvim='env LANG=ja_JP.UTF-8 /usr/local/bin/nvim "$@"'
else
    echo 'neovim not exists.'
fi

# keychain
type keychain > /dev/null 2>&1
if [ $? = 0 ]; then
    echo 'keychain exists.'
    keychain $HOME/.ssh/sakuravps > /dev/null 2>/dev/null
    source $HOME/.keychain/$HOST-sh
else
    echo 'keychain not exists.'
fi

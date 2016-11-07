# java
export JAVA_HOME=/Library/Java/Home

# python
export PYTHONPATH=/usr/local/lib/python3.5/site-packages/


# Vim
#--------------------------------
type vim > /dev/null 2>&1
if [ $? = 0 ]; then
    alias vim="env LANG=en_US.UTF-8 $(which vim 2>/dev/null) \"\$@\""
    export EDITOR=vim
fi


# Neovim
#--------------------------------
type nvim > /dev/null 2>&1
if [ $? = 0 ]; then
    alias nvim="env LANG=en_US.UTF-8 $(which nvim 2>/dev/null) \"\$@\""
    export EDITOR=nvim
fi


# homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=.:$PATH
export PATH=$HOME/bin:$PATH
export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"

alias ctags='/usr/local/bin/ctags'
alias tmux='tmux -2'


# nvm
if [ -d "$(brew --cellar)/nvm" ]; then
    # nvmの遅延読み込み。
    # 参考: http://broken-by.me/lazy-load-nvm/
    export NVM_DIR="$HOME/.nvm"
    nvm() {
        unset -f nvm
        [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"
        nvm "$@"
    }

    node() {
        unset -f node
        [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"
        node "$@"
    }

    npm() {
        unset -f npm
        [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"
        npm "$@"
    }

    electron() {
        unset -f electron
        [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh"
        electron "$@"
    }
fi

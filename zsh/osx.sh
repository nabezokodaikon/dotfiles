# java
export JAVA_HOME=/Library/Java/Home

# python
export PYTHONPATH=/usr/local/lib/python3.5/site-packages/

# vim
export EDITOR=/usr/local/bin/vim

# homebrew
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=.:$PATH
export PATH=$HOME/bin:$PATH
export HOMEBREW_CASK_OPTS="--caskroom=/opt/homebrew-cask/Caskroom"

alias vim='env LANG=ja_JP.UTF-8 /usr/local/bin/vim "$@"'
alias nvim='env LANG=ja_JP.UTF-8 /usr/local/bin/nvim "$@"'
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
fi

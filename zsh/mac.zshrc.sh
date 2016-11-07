#--------------------------------
# Zsh .zshrc for Mac
#--------------------------------

# PATH
#--------------------------------
export PATH=$HOME/bin:$PATH


# Alias
#--------------------------------
alias ls="ls -G"
alias vim="env LANG=en_US.UTF-8 vim \"\$@\""
alias nvim="env LANG=en_US.UTF-8 nvim \"\$@\""
alias tmux="env LANG=en_US.UTF-8 tmux -2u \"\$@\""


# nvm
#--------------------------------
if [ -d "$(brew --cellar)/nvm" ]; then
    # nvmの遅延読み込み。
    # 参考: http://broken-by.me/lazy-load-nvm/
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

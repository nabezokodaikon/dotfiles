#--------------------------------
# Zsh .zshrc for Linux
#--------------------------------

# PATH
#--------------------------------
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/bin:$PATH


# Alias
#--------------------------------
alias ls="ls --color=auto"
alias vim="env LANG=en_US.UTF-8 vim \"\$@\""
alias nvim="env LANG=en_US.UTF-8 nvim \"\$@\""
alias tmux="env LANG=en_US.UTF-8 tmux -2u \"\$@\""
alias pip="LC_ALL=C pip"
alias dl="docker ps -l -q"


# keychain
#--------------------------------
type keychain > /dev/null 2>&1
if [ $? = 0 ]; then
    keychain $HOME/.ssh/sakuravps > /dev/null 2>/dev/null
    source $HOME/.keychain/$HOST-sh
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


# termite
#--------------------------------
if [[ $TERM == xterm-termite ]]; then
  source /etc/profile.d/vte.sh
  __vte_prompt_command
fi

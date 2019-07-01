#--------------------------------
# Zsh .zshrc for Linux
#--------------------------------

# PATH
#--------------------------------
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/bin
export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/sbin:$PATH
export PATH=/home/linuxbrew/.linuxbrew/opt/node@10/bin:$PATH


# Linux brew 
#--------------------------------
umask 002


# Alias
#--------------------------------
alias ls="ls --color=auto"
alias vim="env LANG=en_US.UTF-8 vim \"\$@\""
alias nvim="env LANG=en_US.UTF-8 nvim \"\$@\""
alias tmux="env LANG=en_US.UTF-8 tmux -2u \"\$@\""
alias pip="LC_ALL=C pip"
alias dl="docker ps -l -q"


# dircolors
#--------------------------------
eval $(dircolors -b $HOME/dotfiles/zsh/dircolors)


# keychain
#--------------------------------
type keychain > /dev/null 2>&1
if [ $? = 0 ]; then
    keychain $HOME/.ssh/sakuravps > /dev/null 2>/dev/null
    source $HOME/.keychain/$HOST-sh
fi


# termite
#--------------------------------
if [[ $TERM == xterm-termite ]]; then
  source /etc/profile.d/vte.sh
  __vte_prompt_command
fi


# nvm lazy loading
#--------------------------------
# if [ -s "${HOME}/.config/nvm.sh" ]; then
    # export NVM_DIR="$HOME/.config"
    # nvm() {
        # unset -f nvm
        # [ -s "${HOME}/.config/nvm.sh" ] && source "${HOME}/.config/nvm.sh" 
        # nvm "$@"
    # }

    # node() {
        # unset -f node
        # [ -s "${HOME}/.config/nvm.sh" ] && source "${HOME}/.config/nvm.sh" 
        # node "$@"
    # }

    # npm() {
        # unset -f npm
        # [ -s "${HOME}/.config/nvm.sh" ] && source "${HOME}/.config/nvm.sh" 
        # npm "$@"
    # }
# fi

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
alias ctags='/usr/local/bin/ctags'
alias tmux='tmux -2'


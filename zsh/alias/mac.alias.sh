#--------------------------------
# Alias for Mac
#--------------------------------
alias brew="PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin brew"
alias man="MANPATH=$HOME/bin/man man"

brew_prefix=`brew --prefix`
alias ls="$brew_prefix/bin/gls"
alias rm="$brew_prefix/bin/grm"

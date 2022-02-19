#--------------------------------
# Alias for Mac
#--------------------------------
alias brew="PATH=/opt/homebrew/bin brew"
alias man="MANPATH=$HOME/bin/man man"

brew_prefix=`brew --prefix`
alias rm="$brew_prefix/bin/grm"

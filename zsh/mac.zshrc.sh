#--------------------------------
# Zsh .zshrc for Mac
#--------------------------------

# PATH
#--------------------------------
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# Alias
#--------------------------------
source $HOME/dotfiles/zsh/alias/mac.alias.sh
source $HOME/dotfiles/zsh/alias/common.alias.sh

# nvm lazy loading
#--------------------------------
# if [ -d "$(brew --cellar)/nvm" ]; then
    # export NVM_DIR="$HOME/.nvm"
    # nvm() {
        # unset -f nvm
        # [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh" 
        # nvm "$@"
    # }

    # node() {
        # unset -f node
        # [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh" 
        # node "$@"
    # }

    # npm() {
        # unset -f npm
        # [ -s "$(brew --prefix nvm)/nvm.sh" ] && source "$(brew --prefix nvm)/nvm.sh" 
        # npm "$@"
    # }
# fi

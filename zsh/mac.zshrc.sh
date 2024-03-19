#--------------------------------
# Zsh .zshrc for Mac
#--------------------------------

# PATH
#--------------------------------
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# GO
export GOPATH=$HOME/go
export PATH=$GOPATH/bin/:$PATH

# Alias
#--------------------------------
source $HOME/dotfiles/zsh/alias/mac.alias.sh
source $HOME/dotfiles/zsh/alias/common.alias.sh

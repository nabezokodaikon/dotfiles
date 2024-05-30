#--------------------------------
# Zsh .zshenv for Mac
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


# Homebrew
#--------------------------------
export HOMEBREW_NO_ANALYTICS=1


# OpenSSL
#--------------------------------
export OPENSSL_INCLUDE_DIR=/opt/homebrew/opt/openssl@1.1/include
export OPENSSL_LIB_DIR=/opt/homebrew/opt/openssl@1.1/lib
export PKG_CONFIG_PATH=/opt/homebrew/opt/openssl@1.1/lib/pkgconfig


#--------------------------------
# Zsh .zshenv for Linux
#--------------------------------

# PATH
#--------------------------------
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.deno/bin:$PATH


# SHELL
#--------------------------------
export SHELL=/usr/bin/zsh


# OpenSSL
#--------------------------------
# Ubuntu
# sudo apt install cmake libssl-dev zlib1g-dev
export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu/
export OPENSSL_INCLUDE_DIR=/usr/include/openssl/


# pkg config
#--------------------------------
# Ubuntu
# pkg-config
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig:$PKG_CONFIG_PATH


# Terminal
#--------------------------------
export TERMINAL=gnome-terminal


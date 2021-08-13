#--------------------------------
# Zsh .zshenv for Linux
#--------------------------------

# SHELL
#--------------------------------
export SHELL=/usr/bin/zsh


# Java
#--------------------------------
export JAVA_HOME=$(readlink -f `which javac 2>/dev/null` | sed "s:/bin/javac::")


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

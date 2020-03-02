#--------------------------------
# Zsh .zshenv for Linux
#--------------------------------

# SHELL
#--------------------------------
export SHELL=/usr/bin/zsh


# Java
#--------------------------------
export JAVA_HOME=$(readlink -f `which javac 2>/dev/null` | sed "s:/bin/javac::")


# Neovim
#--------------------------------
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG


# OpenSSL
#--------------------------------
# Ubuntu
# sudo apt install cmake libssl-dev pkg-config
export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu/
export OPENSSL_INCLUDE_DIR=/usr/include/openssl/

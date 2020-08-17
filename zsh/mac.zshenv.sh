#--------------------------------
# Zsh .zshenv for Mac
#--------------------------------

# Neovim
#--------------------------------
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG


# Java
# $ brew cask install caskroom/versions/adoptopenjdk8
#--------------------------------
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)


# OpenSSL
#--------------------------------
export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl@1.1/include
export OPENSSL_LIB_DIR=/usr/local/opt/openssl@1.1/lib
export PKG_CONFIG_PATH=/usr/local/opt/openssl@1.1/lib/pkgconfig

#--------------------------------
# Zsh .zshenv for Mac
#--------------------------------

# PATH
#--------------------------------
export PATH=$PATH:/usr/local/bin:$HOME/bin:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin


# Neovim
#--------------------------------
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG


# Java
# $ brew cask install caskroom/versions/adoptopenjdk8
#--------------------------------
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

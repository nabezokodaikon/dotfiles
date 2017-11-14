#--------------------------------
# Zsh .zshenv for Linux
#--------------------------------

# PATH
#--------------------------------
export PATH=$PATH:~/bin


# Java
#--------------------------------
export JAVA_HOME=$(readlink -f `which javac 2>/dev/null` | sed "s:/bin/javac::")


# Neovim
#--------------------------------
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG

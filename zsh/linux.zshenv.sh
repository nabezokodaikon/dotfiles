#--------------------------------
# Zsh .zshenv for Linux
#--------------------------------

# SHELL
#--------------------------------
export SHELL=/usr/bin/zsh


# PATH
#--------------------------------
export PATH=$PATH:~/bin
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin


# Java
#--------------------------------
export JAVA_HOME=$(readlink -f `which javac 2>/dev/null` | sed "s:/bin/javac::")


# Neovim
#--------------------------------
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG

#--------------------------------
# Zsh .zshenv for Linux
#--------------------------------

# SHELL
#--------------------------------
export SHELL=/usr/bin/zsh


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


# linuxbrew
#--------------------------------
# test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
# test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

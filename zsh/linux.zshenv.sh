#--------------------------------
# Zsh .zshenv for Linux
#--------------------------------
export PATH=$PATH:~/bin

# Java
#--------------------------------
export JAVA_HOME=$(readlink -f `which javac 2>/dev/null` | sed "s:/bin/javac::")


# Scala
#--------------------------------
export SCALA_HOME=$(readlink -f `which scalac 2>/dev/null` | sed "s:/bin/scalac::") 


# Python
#--------------------------------
export NVIM_PYTHON_LOG_FILE=/tmp/log
export NVIM_PYTHON_LOG_LEVEL=DEBUG

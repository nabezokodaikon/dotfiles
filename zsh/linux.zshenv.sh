#--------------------------------
# Zsh .zshenv for Linux
#--------------------------------

# Java
#--------------------------------
export JAVA_HOME=$(readlink -f `which javac 2>/dev/null` | sed "s:/bin/javac::")


# Scala
#--------------------------------
export SCALA_HOME=$(readlink -f `which scalac 2>/dev/null` | sed "s:/bin/scalac::") 

#--------------------------------
# Zsh .zprofile for Linux
#--------------------------------

# Homebrew-on-Linux
#--------------------------------
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

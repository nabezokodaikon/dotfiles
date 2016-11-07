# echo "Call local zshenv."

# zmodload zsh/zprof

source $HOME/dotfiles/zsh/common.zshenv.sh

case "$OSTYPE" in
    darwin*)
        source $HOME/dotfiles/zsh/mac.zshenv.sh
        ;;
    linux*)
        source $HOME/dotfiles/zsh/linux.zshenv.sh
        ;;
esac

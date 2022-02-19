# echo "Call local zshenv."

# zmodload zsh/zprof


case "$OSTYPE" in
    darwin*)
        source $HOME/dotfiles/zsh/mac.zshenv.sh
        source $HOME/dotfiles/zsh/common.zshenv.sh
        ;;
    linux*)
        source $HOME/dotfiles/zsh/linux.zshenv.sh
        source $HOME/dotfiles/zsh/common.zshenv.sh
        ;;
esac

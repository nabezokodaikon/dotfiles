# echo "Call local zshrc."

case "$OSTYPE" in
    darwin*)
        source $HOME/dotfiles/zsh/mac.zshrc.sh
        source $HOME/dotfiles/zsh/common.zshrc.sh
        ;;
    linux*)
        source $HOME/dotfiles/zsh/linux.zshrc.sh 
        source $HOME/dotfiles/zsh/common.zshrc.sh
        ;;
esac

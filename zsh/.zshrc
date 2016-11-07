# echo "Call local zshrc."

source $HOME/dotfiles/zsh/common.zshrc.sh

case "$OSTYPE" in
    darwin*)
        source $HOME/dotfiles/zsh/mac.zshrc.sh
        ;;
    linux*)
        source $HOME/dotfiles/zsh/linux.zshrc.sh 
        ;;
esac

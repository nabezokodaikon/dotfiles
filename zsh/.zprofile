# echo "Call local zprofile."

source $HOME/dotfiles/zsh/common.zprofile.sh

case "$OSTYPE" in
    darwin*)
        source $HOME/dotfiles/zsh/mac.zprofile.sh
        ;;
    linux*)
        source $HOME/dotfiles/zsh/linux.zprofile.sh 
        ;;
esac

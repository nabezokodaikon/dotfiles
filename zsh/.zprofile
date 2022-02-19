# echo "Call local zprofile."

case "$OSTYPE" in
    darwin*)
        source $HOME/dotfiles/zsh/mac.zprofile.sh
        source $HOME/dotfiles/zsh/common.zprofile.sh
        ;;
    linux*)
        source $HOME/dotfiles/zsh/linux.zprofile.sh 
        source $HOME/dotfiles/zsh/common.zprofile.sh
        ;;
esac

# 基本設定
source $HOME/dotfiles/zsh/basic.sh

case "$OSTYPE" in
    darwin*)
        # OSX
        source $HOME/dotfiles/zsh/osx.sh
        ;;
    linux*)
        # Linux
        source $HOME/dotfiles/zsh/linux.sh 
        ;;
esac

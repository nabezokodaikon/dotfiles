# 基本設定
source $HOME/dotfiles/zsh/basic.zshrc

case "$OSTYPE" in
    darwin*)
        # OSX
        source $HOME/dotfiles/zsh/osx.zshrc
        ;;
    linux*)
        # Linux
        source $HOME/dotfiles/zsh/linux.zshrc 
        ;;
esac

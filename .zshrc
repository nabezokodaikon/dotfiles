# 基本設定
source ${HOME}/dotfiles/zsh/basic.zshrc

case "${OSTYPE}" in
    darwin*)
        # OSX
        [ -f ~/dotfiles/zsh/osx.zshrc ] && source ~/dotfiles/zsh/osx.zshrc
        ;;
    linux*)
        # Linux 設定
        [ -f ~/dotfiles/zsh/linux.zshrc ] && source ~/dotfiles/zsh/linux.zshrc 
        ;;
esac

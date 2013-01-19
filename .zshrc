# 補完設定
autoload -Uz compinit
compinit

# 日本語設定
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

case "${OSTYPE}" in
    darwin*)
        # OSX
        [ -f ~/dotfiles/.zshrc_osx ] && source ~/dotfiles/.zshrc_osx
        ;;
    linux*)
        # Linux 設定
        [ -f ~/dotfiles/.zshrc_linux ] && source ~/dotfiles/.zshrc_linux 
        ;;
esac

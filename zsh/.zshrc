# echo "Call local zshrc."

# 基本設定
source $HOME/dotfiles/zsh/basic.sh

case "$OSTYPE" in
    darwin*)
        # macOS
        source $HOME/dotfiles/zsh/mac.sh
        ;;
    linux*)
        # Linux
        source $HOME/dotfiles/zsh/linux.sh 
        ;;
esac

# デフォルトの補完機能を有効化
autoload -Uz compinit
compinit

# ディレクトリ名で cd
setopt auto_cd

# ディレクトリの移動履歴を利用
setopt auto_pushd

# コマンドのスペルチェックを有効化
#setopt correct

# 日本語設定
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# tmux
alias tmux='tmux -2'

# rbenv
if [ -d "${HOME}/.rbenv" ]; then
    echo "rbenv exists."
    export PATH=$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
else
    echo "rbenv not exists."
fi

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

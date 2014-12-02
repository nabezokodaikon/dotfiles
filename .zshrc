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

# キーバインドを vim モードにする。
bindkey -v

# プロンプト
# 色設定
autoload colors
colors

# プロンプトを2行表示し、現在のモードを表示する。
# 参考: http://nishikawasasaki.hatenablog.com/entry/20101227/1293459255
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd)
    PROMPT="%{${fg[blue]}%}%~%{${reset_color}%}
[%n@%m/NOR]$ "
    ;;
    main|viins)
    PROMPT="%{${fg[blue]}%}%~%{${reset_color}%}
[%n@%m/INS]$ "
    ;;
  esac
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# ノーマルモードに移行するキーを変更する。
# 参考: http://qiita.com/syui/items/8cc534c2c30543965950
bindkey -M viins '^j' vi-cmd-mode

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

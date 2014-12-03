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
bindkey -d
bindkey -v

# プロンプト
# 色設定
autoload colors
colors

# git の情報を表示
autoload -Uz vcs_info
setopt prompt_subst
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr '%F{yellow}!'
zstyle ":vcs_info:git:*" unstagedstr '%F{red}+'
zstyle ":vcs_info:*" formats '%F{green}%c%u[%b:%r]%f'
zstyle ":vcs_info:*" actionformats '[%b:%r|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

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

# インクリメンタルサーチ
bindkey '^f' history-incremental-search-forward
bindkey '^h' history-incremental-search-backward
bindkey '^g' send-break

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=10000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

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

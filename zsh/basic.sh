#--------------------------------
# Zsh 基本設定 
#--------------------------------

# 環境変数
#--------------------------------
# 日本語設定
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# 履歴設定
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

# Xdg
# アプリケーションの設定ファイルを保存するディレクトリ
export XDG_CONFIG_HOME=$HOME/.config

# Neovimのログファイル
export NVIM_PYTHON_LOG_FILE=$XDG_CONFIG_HOME/nvim/logs/nvimlog.


# Zsh
#--------------------------------
# デフォルトの補完機能を有効化
autoload -U compinit
# 以下の警告を抑止する。
# zsh compinit: insecure directories, run compaudit for list.
# Ignore insecure directories and continue [y] or abort compinit [n]?
compinit -u

# ディレクトリの移動履歴を利用
setopt auto_pushd

# auto_pushd で重複するディレクトリを記録しない。
setopt pushd_ignore_dups

# インサートモードからノーマルモードへ移行するキーを'jj'としたため、
# エスケープシーケンスの待ち時間をデフォルトの0.4s(400ms)にする。
KEYTIMEOUT=40

# キーバインドをリセットする。
bindkey -d

# キーバインドを vim モードにする。
bindkey -v

# 色設定
autoload -U colors
colors

# 履歴設定
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# git の情報を表示
autoload -U vcs_info
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
    PROMPT="%{${fg[blue]}%}[%n@%m] %~%{${reset_color}%}
[NOR]$ "
    ;;
    main|viins)
    PROMPT="%{${fg[blue]}%}[%n@%m] %~%{${reset_color}%}
[INS]$ "
    ;;
  esac
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# ノーマルモードに移行するキーを変更する。
# 参考: http://qiita.com/syui/items/8cc534c2c30543965950
bindkey -M viins 'jj' vi-cmd-mode

# インクリメンタルサーチ
bindkey '^f' history-incremental-search-forward
bindkey '^b' history-incremental-search-backward
bindkey '^g' send-break

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

# <Ctrl> + z で vim と shell を切り替える。
# 本来なら vim (<Ctrl> + z) > shell (fg<Enter>) > vim
# http://postd.cc/how-to-boost-your-vim-productivity/
fancy-ctrl-z () {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER="fg"
        zle accept-line
    else
        zle push-input
        zle clear-screen
    fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z


# tmux
#--------------------------------
# ログディレクトリを作成する。
if [ ! -e "$XDG_CONFIG_HOME/tmux/logs" ]; then
    mkdir -pv "$XDG_CONFIG_HOME/tmux/logs"
fi


# Neovim
#--------------------------------
# ログディレクトリを作成する。
if [ ! -e "$XDG_CONFIG_HOME/nvim/logs" ]; then
    mkdir -pv "$XDG_CONFIG_HOME/nvim/logs"
fi


# sbt
#--------------------------------
export SBT_OPTS=" \
-Dfile.encoding=UTF-8 \
"

#--------------------------------
# Zsh .zshrc for common
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

# コマンドの実行をキャンセルする。
bindkey '^g' send-break

# 簡易コマンド履歴操作。
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end

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

# 行頭、行末移動
bindkey -M vicmd '^h' vi-digit-or-beginning-of-line
bindkey -M vicmd '^l' vi-end-of-line

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

# fzfのコマンド履歴から重複を除外する。
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# <C-r>でfzfのコマンド履歴を表示。
function select-history() {
  BUFFER=$(history -n -r 1 | \
      fzf-tmux -w '80' -y '16'  \
      -p --layout=reverse --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^f' select-history

# historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# ウィンドウ、ペイン間でコマンド履歴を共有する。
setopt share_history

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

# ノーマルモードに移行するキーを変更する。
bindkey -M viins 'jj' vi-cmd-mode

# 行頭、行末移動
bindkey -M vicmd '^h' vi-digit-or-beginning-of-line
bindkey -M vicmd '^l' vi-end-of-line

# historyに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# ウィンドウ、ペイン間でコマンド履歴を共有する。
setopt share_history


# プロンプトを2行表示し、現在のモードを表示する。
# --------------------------------
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


# git の情報を表示
# --------------------------------
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


# アプリとシェルを切り替える。
# --------------------------------
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


# fzfでコマンド実行履歴を表示する。
# --------------------------------
function select-history() {
  BUFFER=$(history -n -r 1 | \
      fzf-tmux -y '0%' -w '80%' -h '25%' \
      -p --layout=reverse --no-sort +m --query "$LBUFFER" --prompt="cmd > ")
  CURSOR=$#BUFFER
}

zle -N select-history
bindkey '^f' select-history

# fzfのコマンド履歴から重複を除外する。
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS


# cdの履歴を保存して、fzfでディレクトリを移動する。
# --------------------------------
function run_tac_commnad() {
  if [[ "$OSTYPE" == "linux"* ]]; then
    tac ~/.powered_cd.log
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    gtac ~/.powered_cd.log
  else
    echo 'Unsupported os.'
  fi
}

function chpwd() {
  powered_cd_add_log
}

function powered_cd_add_log() {
  local i=0
  cat ~/.powered_cd.log | while read line; do
    (( i++ ))
    if [ i = 30 ]; then
      sed -i -e "30,30d" ~/.powered_cd.log
    elif [ "$line" = "$PWD" ]; then
      sed -i -e "${i},${i}d" ~/.powered_cd.log 
    fi
  done
  echo "$PWD" >> ~/.powered_cd.log
}

function powered_cd() {
  if [ $# = 0 ]; then
    cd $(run_tac_commnad | \
        fzf-tmux -y '0%' -w '80%' -h '25%' \
        -p --layout=reverse --no-sort +m --query "$LBUFFER" --prompt="cd > " \
    )
    zle reset-prompt
  elif [ $# = 1 ]; then
    cd $1
  else
    echo "powered_cd: too many arguments"
  fi
}

_powered_cd() {
  _files -/
}

compdef _powered_cd powered_cd

[ -e ~/.powered_cd.log ] || touch ~/.powered_cd.log

zle -N powered_cd
bindkey '^r' powered_cd

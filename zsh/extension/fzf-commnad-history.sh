# --------------------------------
# fzfでコマンド実行履歴を表示する。
# --------------------------------
function select-history() {
  BUFFER=$(history -n -r 1 | \
      fzf-tmux -w '80%' \
      -p --no-sort +m --query "$LBUFFER" --prompt="> ")
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

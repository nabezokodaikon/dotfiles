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


# プロンプト表示設定
# --------------------------------
source ~/dotfiles/zsh/extension/prompt.sh


# gitの情報を表示
# --------------------------------
source ~/dotfiles/zsh/extension/git-info.sh


# fzfでコマンド実行履歴を表示する。
# --------------------------------
source ~/dotfiles/zsh/extension/fzf-commnad-history.sh

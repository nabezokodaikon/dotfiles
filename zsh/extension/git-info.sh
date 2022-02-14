# --------------------------------
# gitの情報を表示
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

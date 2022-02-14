# --------------------------------
# プロンプト表示設定
# --------------------------------

# プロンプトを2行表示し、現在のモードを表示する。
# --------------------------------
PROMPT_INS="%{${fg[blue]}%}[%n@%m] %~%{${reset_color}%}
[INS]$ "
PROMPT_NOR="%{${fg[blue]}%}[%n@%m] %~%{${reset_color}%}
[NOR]$ "
PROMPT_VIS="%{${fg[blue]}%}[%n@%m] %~%{${reset_color}%}
[VIS]$ "

PROMPT=$PROMPT_INS

function zle-line-pre-redraw {
    if [[ $REGION_ACTIVE -ne 0 ]]; then
        NEW_PROMPT=$PROMPT_VIS
    elif [[ $KEYMAP = vicmd ]]; then
        NEW_PROMPT=$PROMPT_NOR
    elif [[ $KEYMAP = main ]]; then
        NEW_PROMPT=$PROMPT_INS
    fi

    if [[ $PROMPT = $NEW_PROMPT ]]; then
        return
    fi

    PROMPT=$NEW_PROMPT

    zle reset-prompt
}

function zle-keymap-select zle-line-init {
    case $KEYMAP in
        vicmd)
            PROMPT=$PROMPT_NOR
            ;;
        main|viins)
            PROMPT=$PROMPT_INS
            ;;
    esac

    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N zle-line-pre-redraw


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

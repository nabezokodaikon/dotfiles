# --------------------------------
# fzfでディレクトリ移動履歴を表示する。
# --------------------------------
function chpwd() {
  powered_cd_add_log
}

function powered_cd_add_log() {
  local i=0
  cat ~/.powered_cd.log | while read line; do
    (( i++ ))
    if [ $i = 99 ]; then
      sed -i -e "99,99d" ~/.powered_cd.log
    elif [ "$line" = "$PWD" ]; then
      sed -i -e "${i},${i}d" ~/.powered_cd.log
    fi
  done
  echo "$PWD" >> ~/.powered_cd.log
}

function powered_cd() {
  if [ $# = 0 ]; then
    cd $(tail -r ~/.powered_cd.log | \
         fzf-tmux -w '80%' \
         -p --no-sort +m --query "$LBUFFER" --prompt="> "
        )
  else
    echo "powered_cd: This command does not accept any arguments."
  fi
}

_powered_cd() {
  _files -/
}

compdef _powered_cd powered_cd

[ -e ~/.powered_cd.log ] || touch ~/.powered_cd.log

alias cdd="powered_cd"

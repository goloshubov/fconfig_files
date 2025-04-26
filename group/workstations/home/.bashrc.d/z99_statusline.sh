STATUSLINE_K8S_SHOW="${STATUSLINE_K8S_SHOW:-0}"

PWD_COLOR=$On_IBlue
BRANCH_COLOR=$On_IBlack
BRANCH_DIRTY_COLOR=$On_Yellow
VENV_COLOR=$On_Green
K8S_COLOR=$On_Blue
JOBS_COLOR=$On_Red
ECODE_COLOR=$On_IRed
#PROMPT_COLOR=""

LAST_ECODE="0"

pwd_segment() {
  echo -e "${PWD_COLOR}┌ ${PWD/#$HOME/\~} \e[0m"
}

git_segment() {
  BRANCH="$(git branch --show-current 2>/dev/null)"
  if [ ! -z "$BRANCH" ]; then
    if [ -z "$(git status -s)" ]; then
      if [ "$( git status | grep -iE 'ahead|behind' )" != 1 ]; then
        echo -e "${BRANCH_COLOR} ⌥  ${BRANCH} * \e[0m"
      else
        echo -e "${BRANCH_COLOR} ⌥  ${BRANCH} \e[0m"
      fi
    else
      echo -e "${BRANCH_DIRTY_COLOR} ⌥ ${BRANCH} \e[0m"
    fi
  else
    echo ""
  fi
}

k8s_segment() {
  if [ "$STATUSLINE_K8S_SHOW" == "0" ]; then
    echo ""
    return
  fi
  if [ ! -f ~/.kube/config ]; then
    echo ""
    return
  fi
  ctx=$(grep 'current-context'  ~/.kube/config | awk '{ print $2 }')
  ns=$(kubectl config get-contexts $ctx --no-headers=true | awk '{ print $5 }')
  K8S=" ☸  ${ctx}:${ns} "
  echo -e "${K8S_COLOR}${K8S}\e[0m"
}

venv_segment() {
  if [ ! -z "$VIRTUAL_ENV" ]; then 
    VENV_name="$(basename $VIRTUAL_ENV)"
    VENV=" (e) $VENV_name "
  else 
    VENV=""
  fi
  echo -e "${VENV_COLOR}${VENV}\e[0m"
}

# FIXME: colored prompt_segment issue: selecting (up/down arrow buttons) from history is breakingg prompt line with old artefacts
prompt_segment() {
  #echo -e "${PROMPT_COLOR}└ \e[0m"
  echo -e "└ "
}

jobs_segment() {
  JOBS="$( jobs | wc -l )"
  if [ $JOBS == "0" ]; then
    return
  fi
  echo -e "${JOBS_COLOR} ${JOBS} \e[0m"
}

ecode_segment() {
  if [ $LAST_ECODE == "0" ]; then
    return
  fi

  if [ $LAST_ECODE == "130" ]; then
    ECODE="SIGINT"
  elif [ $LAST_ECODE == "143" ]; then
    ECODE="SIGTERM"
  elif [ $LAST_ECODE == "147" ]; then
    ECODE="SIGSTOP"
  else
    ECODE=$LAST_ECODE
  fi

  echo -e "${ECODE_COLOR} ${ECODE} \e[0m 👾"
}

statusline_segments() {
  echo "$(pwd_segment)$(git_segment)$(venv_segment)$(k8s_segment)$(jobs_segment)$(ecode_segment)"
  echo "$(prompt_segment)"
}

statusline_ps1() {
  # save the last exit code by the firtst command in here
  LAST_ECODE=$?
  PS1="$(statusline_segments)"
}

export PS1="$(statusline_segments)"
export PROMPT_COMMAND='statusline_ps1;printf "\033]0;%s@%s:%s\007" "${USER/#$USER/g}" "${HOSTNAME/#$HOSTNAME/l}" "${PWD/#$HOME/\~}";history -a'

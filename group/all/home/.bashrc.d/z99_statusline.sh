# multiline bash prompt

# can be toggled by 'toggle STATUSLINE_K8S_SHOW' command
# ~/.bashrc.d/function_toggle.sh
# ~/.bashrc.d/00_toggle_envs.workstations.sh
STATUSLINE_K8S_SHOW="${STATUSLINE_K8S_SHOW:-0}"

# ~/.bashrc.d/colors.sh
FIRST_COLOR=$On_Blue
HOST_COLOR=$On_Blue
PWD_COLOR=$On_IBlue
BRANCH_COLOR=$On_IBlack
BRANCH_HEAD_COLOR=$On_IBlack
BRANCH_DIRTY_COLOR=$On_Yellow
VENV_COLOR=$On_Green
K8S_CTX_COLOR=$On_Blue
K8S_NS_COLOR=$On_Blue
JOBS_COLOR=$On_Red
ECODE_COLOR=$On_IRed
#PROMPT_COLOR=""
NO_COLOR="\e[0m"

LAST_ECODE="0"

first_segment() {
  echo -e "${FIRST_COLOR}┌${NO_COLOR}"
}

host_segment() {
  echo -e "${HOST_COLOR} ${HOSTNAME} ${NO_COLOR}"
}

pwd_segment() {
  echo -e "${PWD_COLOR} ${PWD/#$HOME/\~} ${NO_COLOR}"
}

git_segment() {
  BRANCH="$(git branch --show-current 2>/dev/null)"
  if [ ! -z "$BRANCH" ]; then
    if [ -z "$(git status -s)" ]; then
      if [ -z "$( git status | grep -iE 'ahead|behind' )" ]; then
        echo -e "${BRANCH_COLOR} ⌥  ${BRANCH} ${NO_COLOR}"
      else
        echo -e "${BRANCH_HEAD_COLOR} ⌥  ${BRANCH} * ${NO_COLOR}"
      fi
    else
      echo -e "${BRANCH_DIRTY_COLOR} ⌥  ${BRANCH} ${NO_COLOR}"
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
  echo -e "${K8S_CTX_COLOR} ☸ ${ctx}${K8S_NS_COLOR}:${ns} ${NO_COLOR}"
}

venv_segment() {
  if [ ! -z "$VIRTUAL_ENV" ]; then 
    VENV_name="$(basename $VIRTUAL_ENV)"
    VENV=" (e) $VENV_name "
  else 
    VENV=""
  fi
  echo -e "${VENV_COLOR}${VENV}${NO_COLOR}"
}

# FIXME: colored prompt_segment issue: selecting (up/down arrow buttons) from history is breakingg prompt line with old artefacts
prompt_segment() {
  #echo -e "${PROMPT_COLOR}└ ${NO_COLOR}"
  echo -e "└ "
}

jobs_segment() {
  JOBS="$( jobs | wc -l )"
  if [ $JOBS == "0" ]; then
    return
  fi
  echo -e "${JOBS_COLOR} ${JOBS} ${NO_COLOR}"
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

  echo -e "${ECODE_COLOR} ${ECODE} ${NO_COLOR} 👾"
}

statusline_segments() {
  #1st line - status
  echo "$(first_segment)$(host_segment)$(pwd_segment)$(git_segment)$(venv_segment)$(k8s_segment)$(jobs_segment)$(ecode_segment)"
  #2nd line - prompt
  echo "$(prompt_segment)"
}

statusline_ps1() {
  # save the last exit code by the first command
  LAST_ECODE=$?
  PS1="$(statusline_segments)"
}

export PS1="$(statusline_ps1)"

PROMPT_COMMAND='statusline_ps1;printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME}" "${PWD/#$HOME/\~}";history -a;__vte_prompt_command'


#{%  if 'workstations' in groups and ansible_hostname in groups['workstations'] %}
#export PROMPT_COMMAND="${PROMPT_COMMAND};__vte_prompt_command"
#{% else %}
#export PROMPT_COMMAND="${PROMPT_COMMAND}"
#{% endif %}

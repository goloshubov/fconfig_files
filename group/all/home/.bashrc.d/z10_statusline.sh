# multiline bash prompt

# ~/.bashrc.d/10_colors.sh
FIRST_COLOR=$On_Blue
HOST_COLOR=$On_Blue
ICON_COLOR=$On_Purple
PWD_COLOR=$On_IBlue
BRANCH_COLOR=$On_IBlack
BRANCH_HEAD_COLOR=$On_IBlack
BRANCH_DIRTY_COLOR=$On_Yellow
VENV_COLOR=$On_Green
K8S_CTX_COLOR=$On_Blue
K8S_CTX_COLOR_HL=$On_Purple
K8S_CTX_COLOR_HL_EGREP='prod|public'
K8S_NS_COLOR=$On_Blue
JOBS_COLOR=$On_Red
ECODE_COLOR=$On_IRed
PROMPT_COLOR="$On_Blue"

LAST_ECODE="0"

first_segment() {
  echo -e "${FIRST_COLOR}┌${NOCOLOR}"
}

host_segment() {
  echo -e "${HOST_COLOR} ${HOSTNAME} ${NOCOLOR}"
}

icon_segment() {
  # works on fedora linux
  # TODO: add other distrs support
  variant="$(grep VARIANT_ID /etc/os-release | awk -F= '{ print $2 }')"
  if [[ $variant == 'workstation' ]]; then
     #echo -e "${ICON_COLOR} 💻 ${NOCOLOR}"
     return
  elif [[ $variant == 'server' ]]; then
     echo -e "${ICON_COLOR} 🖧  ${NOCOLOR}"
  fi
}

pwd_segment() {
  echo -e "${PWD_COLOR} ${PWD/#$HOME/\~} ${NOCOLOR}"
}

git_segment() {
  BRANCH="$( git branch --show-current 2>/dev/null )"
  if [[ -z "$BRANCH" ]]; then
    return
  fi

  if [[ -n "$( git status -s )" ]]; then
    echo -e "${BRANCH_DIRTY_COLOR} ⌥ ${BRANCH} * ${NOCOLOR}"
  else
    if [[ -n "$( git status | grep -iE 'ahead|behind' )" ]]; then
      echo -e "${BRANCH_HEAD_COLOR} ⌥ ${BRANCH} ^ ${NOCOLOR}"
    else
      echo -e "${BRANCH_COLOR} ⌥ ${BRANCH} ${NOCOLOR}"
    fi
  fi
}

k8s_segment() {
  if [[ "$STATUSLINE_K8S_SHOW" == "0" ]]; then
    return
  fi
  if [[ -z "$KUBECONFIG" ]]; then
    KUBECONFIG="${HOME}/.kube/config"
  fi
  if [[ ! -f "$KUBECONFIG" ]]; then
    return
  fi

  ctx=$(grep 'current-context' "$KUBECONFIG" 2>/dev/null | awk '{ print $2 }' 2>/dev/null)
  ns=$(kubectl config get-contexts $ctx --no-headers=true 2>/dev/null | awk '{ print $5 }' 2>/dev/null)

  # highlight cluster only if config filename or current-context has _EGREP string, e.g. prod
  if [[ -z "$( echo $KUBECONFIG | grep -E $K8S_CTX_COLOR_HL_EGREP )" ]] && \
     [[ -z "$( echo $ctx | grep -E $K8S_CTX_COLOR_HL_EGREP )" ]]; then
      # not found, no highlight color
      K8S_CTX_COLOR_HL=$K8S_CTX_COLOR
  fi
  echo -e "${K8S_CTX_COLOR_HL} ☸ ${K8S_CTX_COLOR}${ctx}${K8S_NS_COLOR}:${ns} ${NOCOLOR}"
}

venv_segment() {
  if [[ -z "$VIRTUAL_ENV" ]]; then
    return
  fi
  VENV="$(basename $VIRTUAL_ENV)"
  echo -e "${VENV_COLOR} (e) ${VENV} ${NOCOLOR}"
}

jobs_segment() {
  JOBS="$( jobs | wc -l )"
  if [[ $JOBS == "0" ]]; then
    return
  fi
  echo -e "${JOBS_COLOR} ${JOBS} ${NOCOLOR}"
}

ecode_segment() {
  if [[ $LAST_ECODE == "0" ]]; then
    return
  fi

  if [[ $LAST_ECODE == "130" ]]; then
    ECODE="SIGINT"
  elif [[ $LAST_ECODE == "143" ]]; then
    ECODE="SIGTERM"
  elif [[ $LAST_ECODE == "147" ]]; then
    ECODE="SIGSTOP"
  else
    ECODE=$LAST_ECODE
  fi
  echo -e "${ECODE_COLOR} ${ECODE} ${NOCOLOR} 👾"
}

#inner_segment() {
#  echo -e "$1├${NOCOLOR}"
#}

# FIXME: colored prompt_segment issue: selecting (up/down arrow buttons) from history is breakingg prompt line with old artefacts
prompt_segment() {
  #echo -e "${PROMPT_COLOR}└ ${NOCOLOR}"
  echo -e "└ "
}

statusline_segments() {
  #1st line - status
  echo "$(first_segment)$(icon_segment)$(host_segment)$(pwd_segment)$(git_segment)$(venv_segment)$(k8s_segment)$(jobs_segment)$(ecode_segment)"

  # N line
  #echo "$(inner_segment $COLOR)"

  #last line - prompt
  echo "$(prompt_segment)"
}

statusline_ps1() {
  # save the last exit code by the first command
  LAST_ECODE=$?

  # working directory for the next session
  printf "\033]7;file://%s\033\\" "${PWD}"
  # update title
  printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME}" "${PWD/#$HOME/\~}"

  PS1="$(statusline_segments)"
}

PROMPT_COMMAND='statusline_ps1;history -a'

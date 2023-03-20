alias cpv='rsync -ah --info=progress2'


alias grep_dgrey='GREP_COLORS="ms=01;30" grep --color=always'
alias grep_red='GREP_COLORS="ms=01;31" grep --color=always'
alias grep_red_blink='GREP_COLORS="ms=05;31;40" grep --color=always'
alias grep_green='GREP_COLORS="ms=01;32" grep --color=always'
alias grep_yellow='GREP_COLORS="ms=01;33" grep --color=always'
alias grep_blue='GREP_COLORS="ms=01;34" grep --color=always'
alias grep_purple='GREP_COLORS="ms=01;35" grep --color=always'
alias grep_teal='GREP_COLORS="ms=01;36" grep --color=always'
alias grep_lgrey='GREP_COLORS="ms=01;37" grep --color=always'


FCONFIG_PULL='git -C ~/git/github/fconfig/ pull'
FCONFIG_LOCAL_WS='ansible-playbook -i ~/git/github/fconfig/hosts_workstations ~/git/github/fconfig/workstation.yml -e ansible_connection=local --limit $(hostname)'
FCONFIG_LOCAL_SERVER='ansible-playbook -i ~/git/github/fconfig/hosts_servers ~/git/github/fconfig/server.yml -e ansible_connection=local --limit $(hostname)'
alias fconfig_local_ws="$FCONFIG_PULL && $FCONFIG_LOCAL_WS"
alias fconfig_local_ws_dotfiles="$FCONFIG_PULL && $FCONFIG_LOCAL_WS --tags dotfiles"
alias fconfig_local_srv="$FCONFIG_PULL && $FCONFIG_LOCAL_SERVER"
alias fconfig_local_srv_dotfiles="$FCONFIG_PULL && $FCONFIG_LOCAL_SERVER --tags dotfiles"


# JFF. xscreensaver phosphor like output (for cool-retro-term)
export PHOSPHOR_PATH=/etc/os-release
alias phosphor='while true; do for filename in $(find $PHOSPHOR_PATH -type f,l); do echo filename: $filename; array=$(cat $filename); for (( i=0; i<${#array}; i++ )); do echo -ne "${array:$i:1}"; sleep 0.01; done; done; done'

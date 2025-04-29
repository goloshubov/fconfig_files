alias h10="history 10"
alias h25="history 25"
alias h50="history 50"

alias cpv='rsync -haiv --info=progress2'

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
FCONFIG_LOCAL='ansible-playbook -i ~/git/github/fconfig/inventories/ ~/git/github/fconfig/all.yml -e ansible_connection=local --limit $(hostname)'
alias fconfig_local="$FCONFIG_PULL && $FCONFIG_LOCAL"

# JFF. xscreensaver phosphor like output (for cool-retro-term)
export PHOSPHOR_PATH=/etc/os-release
alias phosphor='while true; do for filename in $(find $PHOSPHOR_PATH -type f,l); do echo filename: $filename; array=$(cat $filename); for (( i=0; i<${#array}; i++ )); do echo -ne "${array:$i:1}"; sleep 0.01; done; done; done'

alias cat='bat -pp'   #bat --plain --paging=never'

alias cpv='rsync -ah --info=progress2'


alias grep_dgrey='GREP_COLORS="ms=01;30" grep --color=auto'
alias grep_red='GREP_COLORS="ms=01;31" grep --color=auto'
alias grep_red_blink='GREP_COLORS="ms=05;31;40" grep --color=auto'
alias grep_green='GREP_COLORS="ms=01;32" grep --color=auto'
alias grep_yellow='GREP_COLORS="ms=01;33" grep --color=auto'
alias grep_blue='GREP_COLORS="ms=01;34" grep --color=auto'
alias grep_purple='GREP_COLORS="ms=01;35" grep --color=auto'
alias grep_teal='GREP_COLORS="ms=01;36" grep --color=auto'
alias grep_lgrey='GREP_COLORS="ms=01;37" grep --color=auto'


alias fconfig_local_ws='git -C ~/git/github/fconfig/ pull && ansible-playbook -i ~/git/github/fconfig/inventory_workstations.ini ~/git/github/fconfig/workstation.yml -e ansible_connection=local --limit $(hostname)'
alias fconfig_local_ws_dotfiles='git -C ~/git/github/fconfig/ pull && ansible-playbook -i ~/git/github/fconfig/inventory_workstations.ini ~/git/github/fconfig/workstation.yml -e ansible_connection=local --limit $(hostname) --tags dotfiles'

alias fconfig_local_srv='git -C ~/git/github/fconfig/ pull && ansible-playbook -i ~/git/github/fconfig/inventory_servers.ini ~/git/github/fconfig/server.yml -e ansible_connection=local --limit $(hostname)'
alias fconfig_local_srv_dotfiles='git -C ~/git/github/fconfig/ pull && ansible-playbook -i ~/git/github/fconfig/inventory_servers.ini ~/git/github/fconfig/server.yml -e ansible_connection=local --limit $(hostname) --tags dotfiles'

venv() {
  if [ "$VIRTUAL_ENV" != "$1" ]; then 
    source /home/goloshubov/python-venv/$1/bin/activate
  fi
}

alias ansible='venv ansible; ansible'
alias ansible-playbook='venv ansible; ansible-playbook'
alias ansible-lint='venv ansible; ansible-lint'

#export FZF_CTRL_R_OPTS="--preview-window hidden"
#export FZF_DEFAULT_OPTS="--cycle --preview-window hidden --preview 'bat --color=always {}'"
export FZF_DEFAULT_OPTS="--cycle --bind=ctrl-p:toggle-preview --preview-window hidden --preview 'bat --color=always {}'"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source /usr/share/fzf/shell/key-bindings.bash

alias vim_p='vim $(fzf --preview "bat --color=always {}")'

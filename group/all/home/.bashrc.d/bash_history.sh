#history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "

shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

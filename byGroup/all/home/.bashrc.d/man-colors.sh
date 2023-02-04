########### man colors ##########
# pager: most
#alias man='man -P /usr/bin/most'
#or pager: less
export GROFF_NO_SGR=yes
# man termcap
# (uses ANSI color codes),for foreground:
# 30-black,31-red,32-green,33-yellow,34-blue,35-magenta,36-cyan,37-light.green,39-default
# Start blinking
export LESS_TERMCAP_mb=$'\e[1;31m'
# Start bold mode
export LESS_TERMCAP_md=$'\e[1;34m'
# End all mode like so, us, mb, md and mr
export LESS_TERMCAP_me=$'\e[0m'
# End standout mode
export LESS_TERMCAP_se=$'\e[0m'
# Start standout mode
export LESS_TERMCAP_so=$'\e[01;44,33m'
# End underlining
export LESS_TERMCAP_ue=$'\e[0m'
# Start underlining
export LESS_TERMCAP_us=$'\e[1;35m'


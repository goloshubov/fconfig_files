# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# usefull for forward search Ctlr-S (while in reverse search Ctrl-R)
stty -ixon

export EDITOR=vim
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

if [ -d ~/.bashrc.d ]; then
  for i in ~/.bashrc.d/*.sh; do
    source $i
  done
  unset i
fi

# deduplicate path
export PATH="$(echo -n $PATH | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')"

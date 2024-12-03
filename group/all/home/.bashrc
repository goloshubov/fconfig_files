# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# usefull for forward search Ctlr-S (while in reverse search Ctrl-R)
stty -ixon

export EDITOR=vim

if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*.sh; do
    source "$file"
  done
fi

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

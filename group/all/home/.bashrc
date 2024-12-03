# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# usefull for forward search Ctlr-S (while in reverse search Ctrl-R)
stty -ixon

export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH:$GOPATH/bin:~/Android/Sdk/platform-tools:${KREW_ROOT:-$HOME/.krew}/bin"

export EDITOR=vim

if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*; do
    source "$file"
  done
fi


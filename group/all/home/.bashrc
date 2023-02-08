# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi


#stty -ixon


export ANDROID_HOME="~/Android/Sdk"
export GOPATH="$HOME/go"
export PATH="$HOME/bin:HOME/.local/bin:$HOME/.cargo/bin:$PATH:$GOPATH/bin:~/Android/Sdk/platform-tools:${KREW_ROOT:-$HOME/.krew}/bin"

export MOZ_ENABLE_WAYLAND=1

export EDITOR=vim
#export EDITOR=hx


#updated for ansible-rulebook
export JDK_HOME=/usr/lib/jvm/java-17-openjdk
export JAVA_HOME=$JDK_HOME
export PIP_NO_BINARY=jpy


## powerline
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi
export POWERLINE_PADDING=3
#export POWERLINE_COMPACT=1
#export POWERLINE_PROMPT="user_info scm python_venv ruby cwd"
#export THEME_CLOCK_FORMAT="%H:%M:%S"



if [ -d ~/.bashrc.d ]; then
  for file in ~/.bashrc.d/*; do
    source "$file"
  done
fi


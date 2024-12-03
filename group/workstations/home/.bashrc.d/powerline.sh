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

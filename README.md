# dotfiles and configs
files repository for [fconfig](https://github.com/goloshubov/fconfig)

Here is expected repo directory structure
```
├── group
│   └── <groupname>
│       ├── dconf
│       ├── etc
│       └── home
└── host
    └── <hostname>
        ├── dconf
        ├── etc
        └── home
```
## features
- fconfig: group and host specific configs support
- fconfig: jinja2 templating support - all *.j2 files
- fconfig: GNOME settings from dconf dump files
- .bashrc.d/*.sh approach, ascending alphabetical precedence, from 0 to Z

## some of configs
- [.vimrc](group/all/home/.vimrc) - main editor
- [Zed](group/workstations/home/.var/app/dev.zed.Zed/config/zed/settings.json) - second editor
- [fzf](group/workstations/home/.bashrc.d/fzf.sh) - advanced search tool, Ctrl-R replacement, quick file browser (for terminal, vim):\
  <img src=".images/fzf_file_browser.png" width="50%" height="50%">
- [bat](group/all/home/.config/bat/config) - cat alternative
- [.tmux.conf](group/all/home/.tmux.conf)
- [.screenrc](group/all/home/.screenrc)
- [powerline](group/workstations/home/.config/powerline)
- [statusline](group/all/home/.bashrc.d/z10_statusline.sh) - homebrew powerline-like bash prompt, simple; powerline's bash alternative\
  ![img](.images/statusline_git_0.png)\
  ![img](.images/statusline_git_1.png)\
  ![img](.images/statusline_git_2.png)\
  ![img](.images/statusline_git_3.png)
- custom [colors](group/all/home/.bashrc.d/LESS_TERMCAP.sh) (man)\
  ![img](.images/man_colors.png)
- [xournal++](group/workstations/home/.var/app/com.github.xournalpp.xournalpp/config/xournalpp/toolbar.ini) - tablet optimized custom menu

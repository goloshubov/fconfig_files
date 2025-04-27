# dotfiles and configs
files repository for [fconfig](https://github.com/goloshubov/fconfig)

Here is expected repo directory structure

```
.
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

## some of configs
- [.vimrc](group/all/home/.vimrc)
- [zed](group/workstations/home/.var/app/dev.zed.Zed/config/settings.json)
- [.tmux.conf](group/all/home/.tmux.conf)
- [.screenrc](group/all/home/.screenrc)
- [xournal++](group/workstations/home/.var/app/com.github.xournalpp.xournalpp/config/xournalpp/toolbar.ini) - tablet optimized custom menu
- [powerline](group/workstations/home/.config/powerline)
- .bashrc.d/*
  - [statusline](group/all/home/.bashrc.d/z99_statusline.sh) - my powerline-like custom bash prompt, simple; instead of powerline's bash\
    ![img](.images/statusline_git_0.png)\
    ![img](.images/statusline_git_1.png)\
    ![img](.images/statusline_git_2.png)\
    ![img](.images/statusline_git_3.png)
  - [fzf](group/workstations/home/.bashrc.d/fzf.sh) - advanced search tool, Ctrl-R replacement, quick file browser (for terminal, vim):\
    <img src=".images/fzf_file_browser.png" width="50%" height="50%">
  - custom [colors](group/all/home/.bashrc.d/LESS_TERMCAP.sh) (man)\
    ![img](.images/man_colors.png)
x

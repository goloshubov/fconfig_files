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
- [powerline](group/workstations/home/.config/powerline) - for vim, tmux
- .bashrc.d/*
  - [statusline](group/workstations/home/.bashrc.d/z99_statusline.sh) - my powerline-like custom bash prompt, simple, tor terminal\
    ![img](.images/statusline_git_0.png)\
    ![img](.images/statusline_git_1.png)\
    ![img](.images/statusline_git_2.png)\
    ![img](.images/statusline_git_3.png)
  - [fzf](group/workstations/home/.bashrc.d/fzf.sh) - advanced search tool, Ctrl-R replacement, quick file browser (for terminal, vim):\
    <img src=".images/fzf_file_browser.png" width="50%" height="50%">
  - custom [colors](group/all/home/.bashrc.d/LESS_TERMCAP.sh) (man)\
    ![img](.images/man_colors.png)
- etc ...

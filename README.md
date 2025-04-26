# dotfiles and configs
a repository for [fconfig](https://github.com/goloshubov/fconfig)

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

## some features
- .bashrc.d/*
  - [statusline](group/workstations/home/.bashrc.d/z99_statusline.sh) (powerline-like custom bash prompt)\
    ![img](.images/statusline_git_0.png)\
    ![img](.images/statusline_git_1.png)\
    ![img](.images/statusline_git_2.png)\
    ![img](.images/statusline_git_3.png)
  - [fzf](group/workstations/home/.bashrc.d/fzf.sh) - advanced search tool, Ctrl-R replacement, quick file browser (for terminal, vim):\
    <img src=".images/fzf_file_browser.png" width="50%" height="50%">
  - custom [colors](group/all/home/.bashrc.d/LESS_TERMCAP.sh) (man)\
    ![img](.images/man_colors.png)
- etc ...

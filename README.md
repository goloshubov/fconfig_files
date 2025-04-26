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
    ![screenshot0](.images/statusline_git_0.png)\
    ![screenshot1](.images/statusline_git_1.png)\
    ![screenshot2](.images/statusline_git_2.png)\
    ![screenshot3](.images/statusline_git_3.png)
  - [fzf](group/workstations/home/.bashrc.d/fzf.sh) - advanced search tool, Ctrl-R replacement, quick file browser:\
    ![screenshot3](.images/fzf_file_browser.png)
  - custom [colors](group/all/home/.bashrc.d/LESS_TERMCAP.sh) (man)\
    ![screenshot3](.images/man_colors.png)
- etc ...

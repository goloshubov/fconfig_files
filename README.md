The source of configs/dotfiles for fconfig playbook (https://github.com/goloshubov/fconfig)

NOTE: this setup is only intended as an example.

Here is expected repo directory structure, all supported dirs (dconf, etc, home) are not mandatory:

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

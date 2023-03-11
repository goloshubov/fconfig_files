The source of configs/dotfiles for fconfig playbook (https://github.com/goloshubov/fconfig).

NOTE: this setup is for my local machines (laptops, workstations, VMs and servers), use it as an example only.

## 
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

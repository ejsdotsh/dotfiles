# setting up my development environment

once upon a time, my dotfiles were clean and consistent, but they were also transferred and synchronized manually
between the various *nix systems i worked on. over the years, the updates i've made to my work dotfiles haven't been
well-reflected in my personal versions, resulting in cluttered files and inconsistent environments. this is both an
automation/cleanup project, and a learning opportunity.

file structure:

```txt
├── docs
│   ├── 2023-01-08-xps-debian.md
│   ├── osx.md
│   └── win10-11.md
├── dotbash
│   ├── dot.aliases
│   ├── dot.bash_profile
│   ├── dot.bash_prompt
│   ├── dot.bashrc
│   ├── dot.exports
│   ├── dot.functions
│   └── dot.path
├── dotconfig
│   ├── git
│   │   ├── config
│   │   └── ignore
│   ├── kitty
│   │   └── kitty.conf
│   ├── mako
│   │   └── config
│   ├── neofetch
│   │   └── config.conf
│   ├── nvim
│   │   ├── init.lua
│   │   └── lua
│   │       ├── plugins
│   │       │   └── packer.lua
│   │       └── settings.lua
│   ├── sway
│   │   └── config
│   └── waybar
│       ├── config
│       └── style.css
├── dotlocal
│   └── bin
│       ├── msedge
│       └── onepass
├── LICENSE
├── README.md
└── scripts
    ├── debian_setup.sh
    ├── docker_install.sh
    ├── setup_environment.sh
    ├── setup_go.sh
    └── sway-run
```

## references

this rewrite is heavily influenced by [daler dotfiles](https://daler.github.io/dotfiles/index.html)

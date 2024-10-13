# setting up my development environment

once upon a time, my dotfiles were clean and consistent, but they were also transferred and synchronized manually
between the various *nix systems i worked on. over the years, the updates i've made to my work dotfiles haven't been
well-reflected in my personal versions, resulting in cluttered files and inconsistent environments. this is both an
automation/cleanup project, and a learning opportunity.

file structure:

```txt
├── docs
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
│   ├── helix
│   │   ├── config.toml
│   │   └── languages.toml
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
│   ├── river
│   │   └── init
│   └── waybar
│       ├── config
│       └── style.css
├── LICENSE
├── README.md
└── scripts
    ├── locker.sh
    ├── container_functions.sh
    ├── setup_environment.sh
```

## references

this rewrite is heavily influenced by [daler dotfiles](https://daler.github.io/dotfiles/index.html)

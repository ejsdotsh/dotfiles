# setting up my development environment

once upon a time, my dotfiles were clean and consistent, but they were also transferred and synchronized manually
between the various *nix systems I worked on. over the years, the updates I've made to my work dotfiles haven't been
well-reflected in my personal versions, resulting in cluttered files and inconsistent environments. this is both an
automation/cleanup project, and a learning opportunity.

file structure:

```txt
.
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
│   └── nvim
│       ├── init.lua
│       └── lua
│           ├── plugins
│           │   └── packer.lua
│           └── settings.lua
├── dotssh
│   └── config
├── LICENSE
├── README.md
└── setup_environment.sh
```

## references

this rewrite is heavily influenced by [daler dotfiles](https://daler.github.io/dotfiles/index.html)

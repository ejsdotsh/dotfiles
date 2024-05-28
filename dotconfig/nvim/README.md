# a modified LazyVim

Based upon the [starter template](https://github.com/LazyVim/starter) for [LazyVim](https://github.com/LazyVim/LazyVim).

## modifications from the starter template

A non-exhaustive list of modifications:

- renamed `lua/config/lazy.lua` to `init.lua`
- removed `colorscheme` from `init.lua`
- remove `.gitignore` and `.git/`
- added `lua/plugins/colorscheme.lua`
- added `lua/plugins/neo-tree.lua`
  ~~- added `lua/plugins/lspconfig.lua`~~
  ~~- added `lua/plugins/nvim-treesitter.lua`~~
  ~~- added `lua/plugins/tree-sitter-hypr.lua`~~
  ~~- not sure if it is working~~
- added to `lua/config/autocmds.lua`
  ~~- added `kiwi.nvim` as a personal wiki~~
- added `disable.lua`

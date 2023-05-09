--[[
--init.lua

  there are many like it, but this one is mine...
    /e.j.
--]]

-- disable unused/unwanted builtin plugins
-- see ./lua/ejs/disable.lua
require("ejs.disable")

-- globals that i expect to be setup
-- see ./lua/ejs/options.lua
require("ejs.options")

-- set leader to " "
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- apply additional/personal keymaps
-- ./lua/ejs/keymaps.lua
require("ejs.keymaps")

-- plugin manager - install packer
-- adapted from kickstart.nvim and from https://github.com/wbthomason/packer.nvim#bootstrapping
-- see ./lua/ejs/plugins.lua
require("ejs.plugins")

-- mason and LSP configs
-- specific configurations sourced from ./lua/ejs/lsp/init.lua
require("ejs.lsp.config")

-- autocompletion
-- see ./lua/ejs/cmplete.lua
require("ejs.cmplete")

-- nvim-tree
-- load the default configuration, but don't open automagically
require("nvim-tree").setup()

-- dap
require("ejs.dap.config")

-- treesitter
require("ejs.treesit")

local cmd = vim.api.nvim_command
cmd "colorscheme catppuccin-macchiato"

require("nvim-web-devicons").setup{
  color_icons = true;
  default = true;
}

-- lualine
-- set the theme, everything else is default...for now
require("lualine").setup{}

-- modeline
-- vim: ts=2 sts=2 sw=2 et

local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- bootstrap packer is not installed
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    -- "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  execute("packadd packer.nvim")
end

-- initial and configure packer
local packer = require("packer")

packer.init({
  enable = true, -- enables profiling via :PackerCompile profile=true
  threshold = 0, -- min loadtime in ms
})

packer.startup(function(use)
  -- let packer manage itself
  use "wbthomason/packer.nvim"
  -- theme
  -- use "ful1e5/onedark.nvim"
  -- vim-go
  -- use "fatih/vim-go"
  -- rose pine theme: https://github.com/rose-pine/neovim
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

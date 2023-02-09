-- install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- package manager
  use "wbthomason/packer.nvim"

  -- LSP Configuration & Plugins
  use {
    "neovim/nvim-lspconfig",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Useful status updates for LSP
      "j-hui/fidget.nvim",
      -- Additional lua configuration, makes nvim stuff amazing
      "folke/neodev.nvim",
    },
  }

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp",
    requires = { 
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      -- fuzzy finding using ripgrep
      --"lukas-reineke/cmp-rp"
    }
  }

  -- from https://github.com/nvim-tree/nvim-tree.lua#install
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    tag = "nightly"
  }
  
  -- highlight, edit, and navigate code
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(require("nvim-treesitter.install").update { with_sync = true })
    end,
  }
  -- additional text objects via treesitter
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  }

  -- DAP for debugging
  use "mfussenegger/nvim-dap"
  -- UI for DAP
  use {
    "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }
  }
  -- dap-python
  use "mfussenegger/nvim-dap-python"

  use({
    'f3fora/nvim-texlabconfig',
    config = function()
        require('texlabconfig').setup(config)
    end,
    -- ft = { 'tex', 'bib' }, -- for lazy loading
    run = 'go build'
    -- run = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
  })
  --[[

  -- Git related plugins

  --use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  --use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

  -- Fuzzy Finder (files, lsp, etc)
  --use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  --use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  --]]

  -- theme
  use { "catppuccin/nvim", as = "catppuccin" }
  -- use({ "rose-pine/neovim", as = "rose-pine" })

  -- fancy statusline
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)

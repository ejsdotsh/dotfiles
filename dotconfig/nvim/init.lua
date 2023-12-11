--[[
--init.lua

  there are many like it, but this one is mine...
    /e.j.
--]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

if vim.g.vscode then
  -- VSCode extension
  require("lazy").setup({
    spec = {
      { "LazyVim/LazyVim", import = "lazyvim.plugins" },
      { import = "lazyvim.plugins.extras.vscode" },
      { import = "plugins" },
    },
  })
else
  -- modified LazyVim starter
  require("lazy").setup({
    spec = {
      -- add LazyVim and import its plugins
      { "LazyVim/LazyVim", import = "lazyvim.plugins" },

      -- editors
      { import = "lazyvim.plugins.extras.editor.symbols-outline" },

      -- languages
      { import = "lazyvim.plugins.extras.lang.clangd" },
      { import = "lazyvim.plugins.extras.lang.docker" },
      { import = "lazyvim.plugins.extras.lang.go" },
      { import = "lazyvim.plugins.extras.lang.json" },
      { import = "lazyvim.plugins.extras.lang.markdown" },
      { import = "lazyvim.plugins.extras.lang.python" },
      -- { import = "lazyvim.plugins.extras.lang.rust" },
      { import = "lazyvim.plugins.extras.lang.tailwind" },
      { import = "lazyvim.plugins.extras.lang.terraform" },
      { import = "lazyvim.plugins.extras.lang.tex" },
      { import = "lazyvim.plugins.extras.lang.yaml" },

      -- dap
      { import = "lazyvim.plugins.extras.dap.core" },
      { import = "lazyvim.plugins.extras.dap.nlua" },

      -- formatting
      { import = "lazyvim.plugins.extras.formatting.black" },
      { import = "lazyvim.plugins.extras.formatting.prettier" },

      -- lsp
      { import = "lazyvim.plugins.extras.lsp.none-ls" },

      -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
      -- import/override with your plugins
      { import = "plugins" },
    },
    defaults = {
      -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
      -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
      lazy = false,
      -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
      -- have outdated releases, which may break your Neovim install.
      version = false, -- always use the latest git commit
      -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
      rtp = {
        -- disable some rtp plugins
        disabled_plugins = {
          "gzip",
          -- "matchit",
          -- "matchparen",
          -- "netrwPlugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  })
end

vim.g.loaded_matchparen = 1

local api = vim.api
local opt = vim.opt
local cmd = vim.api.nvim_command

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore:append { "*.o", "*~", "*.pyc", "*pycache*" }
opt.wildignore:append "Cargo.lock"

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.belloff = "all"         -- no moar bell

opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar

opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true          -- highlight matching parenthesis
opt.ignorecase = true         -- ignore case when searching...
opt.smartcase = true          -- ...unless there is a capital letter in the query

opt.hidden = true -- I like having buffers stay around
opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster

opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor

-- opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamed' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile

opt.number = true             -- show number of the line we're on
opt.relativenumber = true     -- show relative line numbers

opt.splitright = true         -- vertical split to the right
opt.splitbelow = true         -- horizontal split to the bottom

-- taken from tjdevries/config_manager/xdg_config/nvim/plugin/options.lua
-- Cursorline highlighting control
--  Only have it on in the active buffer
opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.syntax = "ON"
opt.termguicolors = true      -- enable 24-bit RGB colors
-- cmd "colorscheme catppuccin-macchiato"

-----------------------------------------------------------
-- Tabs, indent, wrapping
-----------------------------------------------------------
opt.expandtab = true      -- use spaces instead of tabs
opt.tabstop = 2           -- 1 tab == 2 spaces
opt.shiftwidth = 2        -- shift 2 spaces when tab
opt.softtabstop = 2      -- 1 tab == 2 spaces

--opt.smarttab = true
--opt.smartindent = true    -- autoindent new lines

opt.autoindent = true
opt.cindent = true
opt.wrap = true
opt.breakindent = true
opt.showbreak = string.rep(" ", 4)    -- wrap long-lines more smartly
opt.linebreak = true          -- wrap on word boundary

opt.textwidth = 80
opt.colorcolumn = '80,120'    -- line length marker at 80 & 120 characters
-- TODO automagically set textwidth to 120
opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.undofile = true
opt.signcolumn = "yes"

opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false

vim.opt.tags:prepend(string.format('%s/.git/tags', vim.fn.getcwd()))


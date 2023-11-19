-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup()

-- setup mason
require("mason").setup()
require("mason-lspconfig").setup()

-- require LSP config which we can use to attach gopls
lspconfig = require "lspconfig"
util = require "lspconfig/util"

--[[
local lspconfig = require('lspconfig')

-- example to setup sumneko and enable call snippets
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})
--]]

-- go
require "ejs.lsp.gopls"

-- latex
require("lspconfig").texlab.setup{}
require "ejs.lsp.texlab"

-- turn on lsp status updates
require("fidget").setup()

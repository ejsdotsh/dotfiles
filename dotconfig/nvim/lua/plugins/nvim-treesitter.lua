-- if true then
--   return {}
-- end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "diff",
        "dockerfile",
        "hcl",
        "html",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "javascript",
        "json",
        "jsonc",
        "latex",
        -- "markdown",
        -- "markdown_inline",
        "ninja",
        "python",
        "regex",
        "rst",
        "toml",
        "ron",
        "rust",
        "terraform",
        "yaml",
      },
    },
  },
}

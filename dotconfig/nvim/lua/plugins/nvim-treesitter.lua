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
        "dockerfile",
        "json",
        -- "json5",
        "json5",
        -- "markdown",
        -- "markdown_inline",
        "ninja",
        "python",
        "rst",
        "toml",
        "hcl",
        "terraform",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "ron",
        "rust",
        "latex",
        "yaml",
      },
    },
  },
}

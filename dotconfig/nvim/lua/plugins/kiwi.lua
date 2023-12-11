return {
  "serenevoid/kiwi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    {
      name = "homew",
      path = "/home/ejs/repo/ejsdotsh/wiki/hw",
    },
  },
  keys = {
    { "<leader>ww", ':lua require("kiwi").open_wiki_index()<cr>', desc = "Open Wiki index" },
    { "<leader>wp", ':lua require("kiwi").open_wiki_index("personal")<cr>', desc = "Open index of personal wiki" },
    { "<leader>t", ':lua require("kiwi").todo.toggle()<cr>', desc = "Toggle Markdown Task" },
  },
  lazy = true,
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>h", group = "Git hunk" },
      { "<leader>b", group = "Buffer" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>c", group = "Code" },
      { "<leader>t", group = "Terminal" },
    },
  },
}

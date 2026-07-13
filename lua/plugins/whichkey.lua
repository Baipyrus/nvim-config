return {
  {
    "folke/which-key.nvim",
    opts_extend = { "spec" },
    opts = {
      spec = {
        {
          mode = { "n", "x" },
          { "<leader>q", group = "session" },
        },
      },
    },
  },
}

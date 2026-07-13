return {
  {
    "folke/snacks.nvim",
    keys = {
      -- Disable LazyExtra editor.snacks_explorer keymaps
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>e", false },
      { "<leader>E", false },
      -- Disable LazyExtra editor.snacks_picker keymaps
      { "<leader>,", false },
      { "<leader><space>", false },
      {
        "<leader><space>",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      { "<leader>fb", false },
      { "<leader>gs", false },
    },
    opts = {
      dashboard = {
        preset = {
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "p", desc = "Find Project", action = ":lua Snacks.picker.projects()" },
            { icon = " ", key = "s", desc = "Find Session", action = ":AutoSession search" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}

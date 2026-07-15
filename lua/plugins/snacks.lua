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
      { "<leader>fp", false },
      { "<leader>gs", false },
    },
    opts = {
      dashboard = {
        preset = {
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "s", desc = "Find Session", action = ":AutoSession search" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}

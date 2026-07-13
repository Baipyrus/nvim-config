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
  },
}

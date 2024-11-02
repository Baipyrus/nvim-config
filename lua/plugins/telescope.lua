return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = { ["<c-enter>"] = "to_fuzzy_refine" },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    },
    keys = {
      {
        "<leader>gs",
        false,
      },
      {
        "<leader>sf",
        LazyVim.pick("files"),
      },
      {
        "<leader><space>",
        false,
      },
      {
        "<leader><leader>",
        function()
          require("telescope.builtin").buffers({
            sort_mru = true,
          })
        end,
      },
    },
  },
}

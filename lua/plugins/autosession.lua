return {
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      auto_save = true,
      auto_restore = false,
      auto_create = false,
    },
    keys = {
      { "<leader>fs", "<cmd>AutoSession search<cr>", desc = "[F]ind [S]ession" },
    },
  },
}

return {
  {
    -- Git related plugins
    "tpope/vim-fugitive",
    dependencies = {
      {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flogsplit" },
      },
      "idanarye/vim-merginal",
    },
    keys = {
      -- Switch in fugitive.vim status window with the current one
      { "<leader>gs", "<cmd>Gedit :<cr>", desc = "[G]it [S]tatus" },
      { "<leader>gF", "<cmd>Git fetch<cr>", desc = "[G]it [F]etch" },
      { "<leader>gP", "<cmd>Git push<cr>", desc = "[G]it [P]ush" },
      { "<leader>gp", "<cmd>Git pull<cr>", desc = "[G]it [P]ull" },
      { "<leader>gl", "<cmd>Flogsplit<cr><cmd>wincmd k<cr><cmd>q<cr>", desc = "[G]it [L]og" },
      { "<leader>gm", "<cmd>Merginal<cr>", desc = "[G]it [M]erginal" },
    },
  },
}

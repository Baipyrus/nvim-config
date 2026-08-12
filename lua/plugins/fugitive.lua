return {
  {
    -- Git related plugins
    "tpope/vim-fugitive",
    config = function()
      -- Switch in fugitive.vim status window with the current one
      vim.keymap.set("n", "<leader>gs", "<cmd>Gedit :<cr>", { desc = "[G]it [S]tatus" })
      -- Fetch all changes
      vim.keymap.set("n", "<leader>gF", "<cmd>Git fetch --prune --all<cr>", { desc = "[G]it [F]etch" })
      -- Push changes
      vim.keymap.set("n", "<leader>gP", "<cmd>Git push<cr>", { desc = "[G]it [P]ush" })
      -- Pull changes
      vim.keymap.set("n", "<leader>gp", "<cmd>Git pull<cr>", { desc = "[G]it [P]ull" })
      -- Show git log graph
      vim.keymap.set(
        "n",
        "<leader>gg",
        "<cmd>Git ++curwin log --graph --max-count=1000 --pretty='format:%h -%d %s (%cr)' --abbrev-commit --date=relative<cr>",
        { desc = "[G]it Log [G]raph" }
      )
    end,
  },
}

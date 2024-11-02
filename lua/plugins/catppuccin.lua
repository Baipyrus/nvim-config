return {
  -- add catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        cmp = true,
        dashboard = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
    keys = {
      {
        "<leader>tt",
        function()
          vim.cmd.colorscheme(vim.o.background == "dark" and "catppuccin-latte" or "catppuccin-mocha")
        end,
        desc = "[T]oggle [T]heme",
      },
    },
  },
  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}

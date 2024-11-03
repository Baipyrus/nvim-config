return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint_d",
        "prettierd",
        "markdownlint",
        "isort",
        "powershell-editor-services",
      },
    },
    keys = {
      { "<leader>cm", false },
      { "<leader>m", "<cmd>Mason<cr>" },
    },
  },
}

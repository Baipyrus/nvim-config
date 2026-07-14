-- All these functions are stolen from LazyVim's own JDTLS default config
local root_dir = (function()
  local fname = vim.api.nvim_buf_get_name(0)
  return vim.fs.root(fname, vim.lsp.config.jdtls.root_markers)
end)()

-- How to find the project name for a given root dir.
local project_name = (function()
  return root_dir and vim.fs.basename(root_dir)
end)()

-- Where are the workspace dirs for a project?
local workspace_dir = (function()
  local project_dir = vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
  return vim.fn.glob(project_dir .. "/" .. project_name .. "*") or project_dir
end)()

-- Add "explore" as a keymap group for java projects
require("which-key").add({ { "<leader>e", group = "explore", mode = "n", buffer = true } })

vim.keymap.set("n", "<leader>ew", function()
  vim.cmd("Oil " .. workspace_dir)
end, {
  desc = "[E]xplore [W]orkplace",
  buffer = vim.fn.bufnr(),
})

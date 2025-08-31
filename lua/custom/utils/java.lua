local M = {}

local util = require 'jdtls.util'

-- Needs to be unique but also traceable
function M.project_dir()
  local project_hash = vim.fn.sha256(vim.fn.getcwd())
  local project_dir = vim.fn.stdpath 'data' .. '/site/java/workspace-root/' .. project_hash

  return project_dir
end

-- The actual data directory inside the project
-- Only works after having been generated
---@return string
function M.workspace_dir()
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

  local project_dir = M.project_dir()
  local workspace_dir = vim.fn.glob(project_dir .. '/' .. project_name .. '*')

  return workspace_dir or project_dir
end

return M

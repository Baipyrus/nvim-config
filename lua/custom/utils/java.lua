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

-- Get classpaths and entrypoint classname
--- @return string[]
function M.get_classpaths()
  ---@type string[]|nil
  local classpaths = nil
  local done = false

  -- Try calling function with project classpaths
  util.with_classpaths(function(resp)
    assert(resp ~= nil, 'JDT-LS not attached to buffer!')
    classpaths = resp.classpaths
    done = true
  end)

  -- Wait up to 1sec for execution of callback
  local ok = vim.wait(1000, function()
    return done
  end, 10)

  -- Timeout; classpaths not found
  if not ok then
    error 'Timeout waiting for classpaths!'
  end

  assert(classpaths ~= nil)
  local workspace_dir = M.workspace_dir()

  -- Replace workspace path with `cwd` in classpaths
  for idx, path in ipairs(classpaths) do
    if string.find(path, workspace_dir, nil, true) then
      table.remove(classpaths, idx)
      break
    end
  end
  table.insert(classpaths, 1, '.')

  return classpaths
end

return M

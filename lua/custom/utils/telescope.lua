local M = {}

-- builtin telescope modules
local utils = require 'telescope.utils'
local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'
local action_state = require 'telescope.actions.state'

--- Reference: [telescope.actions.git_apply_stash](https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/init.lua#L587)
--- @param prompt_bufnr number: The prompt buffer number from Telescope.
local function git_apply_stash(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  if selection == nil then
    utils.__warn_no_selection 'actions.git_apply_stash'
    return
  end
  actions.close(prompt_bufnr)
  -- Remove unwanted '--index' flag from command
  local _, ret, stderr = utils.get_os_command_output { 'git', 'stash', 'apply', selection.value }
  if ret == 0 then
    utils.notify('actions.git_apply_stash', {
      msg = string.format("applied: '%s' ", selection.value),
      level = 'INFO',
    })
  else
    utils.notify('actions.git_apply_stash', {
      ---@diagnostic disable-next-line: param-type-mismatch
      msg = string.format("Error when applying: %s. Git returned: '%s'", selection.value, table.concat(stderr, ' ')),
      level = 'ERROR',
    })
  end
end

--- Custom function to match any unique characters inside a pattern.
--- @param str string: The input string to scan.
--- @param pat string: The pattern to search for.
--- @param arr table: The output table to append to.
function M.match_to_list(str, pat, arr)
  string.gsub(str, pat, function(match)
    -- do not insert existing entry into index list
    if not vim.list_contains(arr, match) then
      table.insert(arr, match)
    end
  end)
end

--- Get all selected entries in the Telescope picker and extract stash indices.
--- @param prompt_bufnr number: The prompt buffer number from Telescope.
--- @return table|false: A list of stash indices or false if nothing is selected.
function M.get_stash_selections(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local selection = picker:get_multi_selection()

  local stashes = {}
  -- scan all multi_selection entries
  for _, entry in ipairs(selection) do
    local value = entry.value
    M.match_to_list(value, '{(.-)}', stashes)
  end

  -- scan single selected entry
  local entry = action_state.get_selected_entry()
  if entry == nil and #stashes == 0 then
    vim.notify(
      ---@diagnostic disable-next-line: param-type-mismatch
      string.format('WARN [%s]: Nothing currently selected', 'git_drop_stash'),
      vim.log.levels.WARN,
      { title = 'telescope.nvim' }
    )
    return false
  end
  M.match_to_list(entry.value, '{(.-)}', stashes)

  return stashes
end

--- Drop git stashes by their indices.
--- @param stashes table: A list of stash indices to drop.
function M.git_drop_stash(stashes)
  local success = {}
  for idx = #stashes, 1, -1 do
    -- execute git command in os
    -- reference: https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/actions/init.lua#L594
    local _, ret, stderr = utils.get_os_command_output { 'git', 'stash', 'drop', string.format('stash@{%d}', stashes[idx]) }
    if ret ~= 0 then
      -- extracted from telescope.utils.notify:
      vim.notify(
        ---@diagnostic disable-next-line: param-type-mismatch
        string.format("Error when dropping: stash@{%s}. Git returned: '%s'", stashes[idx], table.concat(stderr, ' ')),
        vim.log.levels.ERROR,
        { title = 'telescope.nvim' }
      )
      return
    end
    table.insert(success, stashes[idx])
  end

  -- extracted from telescope.utils.notify:
  vim.notify(string.format("dropping: 'stash@{%s}' ", table.concat(success, ', ')), vim.log.levels.INFO, { title = 'telescope.nvim' })
end

--- Extend the Telescope `git_stash` picker with custom mappings.
function M.git_stash()
  builtin.git_stash {
    attach_mappings = function(_, map)
      actions.select_default:replace(git_apply_stash)

      --- @param prompt_bufnr number: The prompt buffer number from Telescope.
      local function git_drop_stash(prompt_bufnr)
        -- Try getting all selections in telescope picker
        local stashes = M.get_stash_selections(prompt_bufnr)
        if stashes == false then
          return
        end
        assert(type(stashes) == 'table', 'Telescope picker selection did not result in list!')

        -- try dropping and close picker when done
        M.git_drop_stash(stashes)
        actions.close(prompt_bufnr)
      end
      map({ 'n', 'i' }, '<C-S-d>', git_drop_stash)
      return true
    end,
  }
end

return M

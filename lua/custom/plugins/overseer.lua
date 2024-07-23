return {
  -- Simple task runner plugin
  'stevearc/overseer.nvim',
  opts = {},
  config = function()
    local overseer = require 'overseer'
    overseer.setup {
      templates = {
        'builtin',
        'golang.run_project',
        'golang.run_file',
      },
    }

    -- Reference: overseer.nvim/lua/overseer/window.lua
    local function is_open()
      for _, winid in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local bufnr = vim.api.nvim_win_get_buf(winid)
        if vim.bo[bufnr].filetype == 'OverseerList' then
          return true
        end
      end
      return false
    end

    -- Display status info about tasks
    vim.keymap.set('n', '<leader>ol', function()
      overseer.toggle { winid = 0 }
      if is_open() then
        vim.cmd.winc '_'
      else
        vim.api.nvim_buf_delete(vim.api.nvim_get_current_buf(), {})
      end
    end, { desc = '[O]verseer [L]og' })
    -- Run task by listing all in floating
    vim.keymap.set('n', '<leader>or', '<cmd>OverseerRun<cr>', { desc = '[O]verseer [R]un' })
  end,
}

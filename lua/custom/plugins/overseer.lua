return {
  {
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
        task_list = {
          bindings = {
            ['<C-h>'] = false,
            ['<C-j>'] = false,
            ['<C-k>'] = false,
            ['<C-l>'] = false,
            ['q'] = false,
          },
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
        -- Get currently open windows (detects splits)
        local curWindows = #vim.api.nvim_tabpage_list_wins(0)
        -- Use builtin toggle if already using splits
        if curWindows ~= (is_open() and 2 or 1) then
          vim.cmd 'OverseerToggle'
          return
        end

        -- Otherwise, toggle overseer in fullscreen
        overseer.toggle { winid = 0 }
        local bufnr = vim.api.nvim_get_current_buf()
        if is_open() then
          -- Maximize height
          vim.cmd.winc '_'
        elseif vim.bo[bufnr].filetype == '' and vim.bo.buftype ~= 'terminal' then
          -- Delete empty buffer created by overseer
          vim.api.nvim_buf_delete(bufnr, {})
        end
      end, { desc = '[O]verseer [L]og' })
      -- Run task by listing all in floating
      vim.keymap.set('n', '<leader>or', '<cmd>OverseerRun<cr>', { desc = '[O]verseer [R]un' })
    end,
  },
}

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

    -- Display status info about tasks
    vim.keymap.set('n', '<leader>ol', function()
      overseer.toggle { winid = 0 }
      vim.cmd.winc '_'
    end, { desc = '[O]verseer [L]og' })
    -- Run task by listing all in floating
    vim.keymap.set('n', '<leader>or', '<cmd>OverseerRun<cr>', { desc = '[O]verseer [R]un' })
  end,
}

return {
  -- Simple task runner plugin
  'stevearc/overseer.nvim',
  opts = {},
  config = function(_, opts)
    local overseer = require 'overseer'
    overseer.setup(opts or {})

    -- Display status info about tasks
    vim.keymap.set('n', '<leader>ol', function()
      overseer.toggle { winid = 0 }
    end, { desc = '[O]verseer [L]og' })
    -- Run task by listing all in floating
    vim.keymap.set('n', '<leader>or', '<cmd>OverseerRun<cr>', { desc = '[O]verseer [R]un' })
  end,
}

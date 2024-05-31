return {
  -- Simple task runner plugin
  'stevearc/overseer.nvim',
  opts = {},
  config = function(_, opts)
    require('overseer').setup(opts or {})

    -- Display status info about tasks
    vim.keymap.set('n', '<leader>ol', '<cmd>OverseerToggle<cr>', { desc = '[O]verseer [L]og' })
    -- Run task by listing all in floating
    vim.keymap.set('n', '<leader>or', '<cmd>OverseerRun<cr>', { desc = '[O]verseer [R]un' })
  end,
}

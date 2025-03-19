-- Smooth scroll plugin and keymaps
return {
  {
    'karb94/neoscroll.nvim',
    enabled = not vim.g.neovide,
    config = function()
      local neoscroll = require 'neoscroll'
      neoscroll.setup {
        hide_cursor = false,
      }

      -- Define modes for all mappings
      local modes = { 'n', 'v', 'x' }

      -- Scroll normally
      vim.keymap.set(modes, '<C-u>', function()
        neoscroll.ctrl_u { duration = 50 }
      end)
      vim.keymap.set(modes, '<C-d>', function()
        neoscroll.ctrl_d { duration = 50 }
      end)

      -- Scroll entire page height
      vim.keymap.set(modes, '<C-b>', function()
        neoscroll.ctrl_b { duration = 80 }
      end)
      vim.keymap.set(modes, '<C-f>', function()
        neoscroll.ctrl_f { duration = 80 }
      end)

      -- Scroll 10% at a time
      vim.keymap.set(modes, '<C-y>', function()
        neoscroll.scroll(-0.10, { move_cursor = false, duration = 25 })
      end)
      vim.keymap.set(modes, '<C-e>', function()
        neoscroll.scroll(0.10, { move_cursor = false, duration = 25 })
      end)

      -- Jump to top, bottom and center
      vim.keymap.set(modes, 'zt', function()
        neoscroll.zt { half_win_duration = 40 }
      end)
      vim.keymap.set(modes, 'zz', function()
        neoscroll.zz { half_win_duration = 50 }
      end)
      vim.keymap.set(modes, 'zb', function()
        neoscroll.zb { half_win_duration = 40 }
      end)
    end,
  },
}

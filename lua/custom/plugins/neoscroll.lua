-- Smooth scroll plugin and keymaps
return {
  'karb94/neoscroll.nvim',
  enabled = not vim.g.neovide,
  config = function()
    require('neoscroll').setup {
      hide_cursor = false,
      easing_function = nil,
      respect_scrolloff = true,
    }

    require('neoscroll.config').set_mappings {
      -- Scroll normally
      ['<C-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '50' } },
      ['<C-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '50' } },
      -- Scroll entire page height
      ['<C-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '80' } },
      ['<C-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '80' } },
      -- Scroll 10% at a time
      ['<C-y>'] = { 'scroll', { '-0.10', 'false', '25' } },
      ['<C-e>'] = { 'scroll', { '0.10', 'false', '25' } },
      -- Jump to top, bottom and center
      ['zt'] = { 'zt', { '40' } },
      ['zz'] = { 'zz', { '50' } },
      ['zb'] = { 'zb', { '40' } },
    }
  end,
}

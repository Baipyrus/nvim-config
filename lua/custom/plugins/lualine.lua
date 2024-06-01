return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = vim.g.have_nerd_font,
      theme = 'catppuccin',
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },
    },
  },
}

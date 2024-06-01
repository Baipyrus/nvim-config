return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = vim.g.have_nerd_font,
      theme = 'catppuccin',
      component_separators = '|',
      section_separators = ' ',
    },
  },
}

-- Switch in fugitive.vim status window with the current one
vim.keymap.set('n', '<leader>gs', '<cmd>Gedit :<cr>', { desc = '[G]it [S]tatus' })

return {
  -- Git related plugins
  'tpope/vim-fugitive',
  dependencies = {
    'tpope/vim-rhubarb',
  },
}

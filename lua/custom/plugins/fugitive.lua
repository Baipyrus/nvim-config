-- Switch in fugitive.vim status window with the current one
vim.keymap.set('n', '<leader>gs', '<cmd>Gedit :<cr>', { desc = '[G]it [S]tatus' })
-- Fetch all changes
vim.keymap.set('n', '<leader>gF', '<cmd>Git fetch<cr>', { desc = '[G]it [F]etch' })
-- Push changes
vim.keymap.set('n', '<leader>gP', '<cmd>Git push<cr>', { desc = '[G]it [P]ush' })
-- Pull changes
vim.keymap.set('n', '<leader>gp', '<cmd>Git pull<cr>', { desc = '[G]it [P]ull' })
-- Open history graph
vim.keymap.set('n', '<leader>gl', '<cmd>Flogsplit<cr><cmd>wincmd k<cr><cmd>q<cr>', { desc = '[G]it [L]og' })

return {
  -- Git related plugins
  'tpope/vim-fugitive',
  dependencies = {
    {
      'rbong/vim-flog',
      lazy = true,
      cmd = { 'Flogsplit' },
    },
    'idanarye/vim-merginal',
  },
}

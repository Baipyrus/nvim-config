return {
  {
    'moll/vim-bbye',
    config = function()
      vim.keymap.set('n', '<leader>bd', '<cmd>Bdelete<cr>', { desc = '[B]uffer [D]elete' })
    end,
  },
}

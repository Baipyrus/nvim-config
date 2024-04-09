-- Set keymap to open chat in browser
vim.keymap.set('n', '<leader>cc', ':execute codeium#Chat()<Enter>', { desc = '[C]odeium [C]hat' })

return {
  -- Free Github Copilot alternative
  'Exafunction/codeium.vim',
  event = 'BufEnter',
}

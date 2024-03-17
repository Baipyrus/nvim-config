-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

-- Open nvim-neo-tree window
vim.keymap.set({ 'n', 'v' }, '<leader>f', ':Neotree toggle<enter>', { desc = 'Explore [F]ile Tree' })

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            'node_modules',
            '.svelte-kit',
            'target',
            '.git',
            'bin',
            'obj',
          },
        },
      },
    }
  end,
}

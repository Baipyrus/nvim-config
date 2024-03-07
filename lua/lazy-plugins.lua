-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- [[ Plugin Specs list ]]

  -- NOTE: First, some plugins that don't require any configuration
  -- Discord RPC
  'andweeb/presence.nvim',

  -- Practice games
  'ThePrimeagen/vim-be-good',

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Smooth scroll plugin and keymaps
  {
    'karb94/neoscroll.nvim',
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
  },

  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Setup neovim lua configuration
  { 'folke/neodev.nvim', opts = {} },

  -- modular approach: using `require 'path/name'` will
  -- include a plugin definition from file lua/path/name.lua

  require 'kickstart/plugins/gitsigns',

  require 'kickstart/plugins/which-key',

  require 'kickstart/plugins/telescope',

  require 'kickstart/plugins/lspconfig',

  require 'kickstart/plugins/conform',

  require 'kickstart/plugins/cmp',

  require 'kickstart/plugins/tokyonight',

  require 'kickstart/plugins/todo-comments',

  require 'kickstart/plugins/mini',

  require 'kickstart/plugins/treesitter',

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- put them in the right spots if you want.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart
  --
  --  Here are some example plugins that I've included in the kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).

  require 'kickstart.plugins.debug',
  require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et

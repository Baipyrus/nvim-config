-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VimEnter'
--
-- which loads which-key before all the UI elements are loaded. Events can be
-- normal autocommands events (`:help autocmd-events`).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
        ['<leader>b'] = { name = '[B]uffer/[B]reakpoint', _ = 'which_key_ignore' },
        ['<leader>c'] = { name = '[C]ode/[C]odeium/[C]hange', _ = 'which_key_ignore' },
        ['<leader>cd'] = { name = '[D]irectory', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ocument/[D]elete', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unk/[H]arpoon', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>dn'] = { name = '[N]o', _ = 'which_key_ignore' },
      }

      -- register which-key VISUAL mode
      -- required for visual <leader>hs (hunk stage) to work
      require('which-key').register({
        ['<leader>'] = { name = 'VISUAL <leader>' },
        ['<leader>h'] = { 'Git [H]unk' },
        ['<leader>d'] = { name = '[D]elete', _ = 'which_key_ignore' },
        ['<leader>p'] = { name = '[P]aste', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>dn'] = { name = '[N]o', _ = 'which_key_ignore' },
        ['<leader>pn'] = { name = '[N]o', _ = 'which_key_ignore' },
      }, { mode = 'v' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

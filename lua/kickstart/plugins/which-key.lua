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
      require('which-key').add {
        { '<leader>c', group = '[C]ode-/[C]hange' },
        { '<leader>d', group = '[D]ocument/[D]elete', mode = { 'n', 'v' } },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle/[T]erminal', mode = { 'n', 'v' } },
        { '<leader>h', group = 'Git [H]unk/[H]arpoon', mode = { 'n', 'v' } },
        { '<leader>g', group = '[G]it/[G]lobal', mode = { 'n', 'v' } },
        { '<leader>b', group = '[B]uffer/[B]reakpoint' },
        { '<leader>cd', group = '[D]irectory' },
        { '<leader>dn', group = '[N]o', mode = { 'n', 'v' } },
        { '<leader>l', group = '[L]ist', mode = { 'n', 'v' } },
        { '<leader>f', group = '[F]ormat/[F]ile', mode = { 'n', 'v' } },
        { '<leader>o', group = '[O]verseer', mode = { 'n', 'v' } },
        { '<leader>p', group = '[P]aste', mode = { 'v' } },
        { '<leader>pn', group = '[N]o', mode = { 'v' } },
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

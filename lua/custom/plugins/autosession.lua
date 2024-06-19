-- Plugin to automatically create and restore simple sessions
return {
  'rmagatti/auto-session',
  config = function()
    require('auto-session').setup {
      auto_session_enable_last_session = true,
    }
  end,
}

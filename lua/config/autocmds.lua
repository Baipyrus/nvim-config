-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("UIEnter", {
  group = vim.api.nvim_create_augroup("SetGUISettings", { clear = true }),
  callback = function()
    -- Options specifically targeted at Neovide
    if vim.g.neovide then
      vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h14"
      vim.g.neovide_hide_mouse_when_typing = true
      vim.g.neovide_cursor_animation_length = 0
      vim.g.neovide_cursor_trail_length = 0
    end
  end,
})

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Buffers navigation
del("n", "<S-h>", { desc = "Prev Buffer" })
del("n", "<S-l>", { desc = "Next Buffer" })

-- Remove new file keymap
del("n", "<leader>fn", { desc = "New File" })

-- Remove lazygit keymaps
if vim.fn.executable("lazygit") == 1 then
  del("n", "<leader>gg", { desc = "Lazygit (Root Dir)" })
  del("n", "<leader>gG", { desc = "Lazygit (cwd)" })
end

-- Remove quit all keymap
del("n", "<leader>qq", { desc = "Quit All" })

-- Open snacks dashboard keymap
map("n", "<leader>h", Snacks.dashboard.open, { desc = "Open Dashboard" })

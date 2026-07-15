-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Snacks features
vim.g.snacks_animate = false

local opt = vim.opt

-- Minimal spacing to keep around the cursor.
opt.scrolloff = 8
opt.sidescrolloff = 12

-- Options for `magatti/auto-session`
opt.sessionoptions =
  { "blank", "buffers", "curdir", "folds", "help", "tabpages", "winsize", "winpos", "terminal", "localoptions" }

-- Size of an indent
opt.tabstop = 4
opt.softtabstop = 4

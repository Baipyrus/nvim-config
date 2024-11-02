-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save start directory as base
vim.g.base_dir = vim.fn.getcwd()

-- Set display language
vim.cmd("silent! language en_US")

-- Detect and use PowerShell on Windows
if vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1 then
  LazyVim.terminal.setup("pwsh")
end

-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true

-- Set characters to view whitespaces
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Minimal spacing to keep around the cursor.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 12

-- Set cursor pointer to block
vim.opt.guicursor = "n-v-i-c:block-Cursor"

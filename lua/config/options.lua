-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Save start directory as base
vim.g.base_dir = vim.fn.getcwd()

-- Set display language
vim.cmd("silent! language en_US")

-- Sets the shell to use for system() and ! commands in windows and wsl
if vim.fn.has("win32") == 1 or vim.fn.has("wsl") == 1 then
  vim.opt.shell = vim.fn.executable("pwsh.exe") == 1 and "pwsh.exe" or "powershell.exe"
  vim.opt.shellcmdflag =
    "-NoLogo -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
  vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
  vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
  vim.opt.shellxquote = ""
  vim.opt.shellquote = ""
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

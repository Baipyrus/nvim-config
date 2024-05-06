-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Set display language
vim.api.nvim_exec2('language en_US', {})

-- Shell options
-- Sets the shell to use for system() and ! commands
vim.opt.shell = 'powershell.exe'
vim.opt.shellcmdflag = '-NonInteractive -NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
vim.opt.shellxquote = ''
vim.opt.shellquote = ''
vim.opt.shellredir = '2>&1 | Out-File -Encoding UTF8 %s'
vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s'

-- Format settings
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line wrap
vim.opt.wrap = false

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal spacing to keep around the cursor.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 12

-- Set cursor pointer to block
vim.opt.guicursor = 'n-v-i-c:block-Cursor'

-- Options specifically targeted at Neovide
if vim.g.neovide then
  vim.o.guifont = 'CaskaydiaCove Nerd Font Mono:h14'
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_length = 0
end

-- vim: ts=2 sts=2 sw=2 et

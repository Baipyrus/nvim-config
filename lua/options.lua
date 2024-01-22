-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set display language
vim.api.nvim_exec2('language en_US', {})

-- Shell options
-- Sets the shell to use for system() and ! commands
vim.o.shell = 'powershell.exe'
vim.o.shellcmdflag = '-NonInteractive -NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
vim.o.shellxquote = ''
vim.o.shellquote = ''
vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s'
vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s'

-- Format settings
-- Line numbers
vim.o.nu = true
vim.o.relativenumber = true

-- Indenting
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

-- Line wrap
vim.o.wrap = false

-- Search
vim.o.scrolloff = 8

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- vim: ts=2 sts=2 sw=2 et

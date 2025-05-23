-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Set display language
vim.cmd 'silent! language en_US'

local is_windows = vim.fn.has 'win32' == 1 or vim.fn.has 'wsl' == 1
-- Shell options
-- Sets the shell to use for system() and ! commands in windows and wsl
if is_windows then
  vim.opt.shell = vim.fn.executable 'pwsh.exe' == 1 and 'pwsh.exe' or 'powershell.exe'
  vim.opt.shellcmdflag = '-NoLogo -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
  vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  vim.opt.shellxquote = ''
  vim.opt.shellquote = ''
end

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
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 12

-- Set cursor pointer to block
vim.opt.guicursor = 'n-v-i-c:block-Cursor'

-- Set global statusline
vim.o.laststatus = 3
vim.api.nvim_set_hl(0, 'WinSeparator', { bg = nil })

-- Disable tabpages
vim.api.nvim_create_autocmd('TabNew', {
  group = vim.api.nvim_create_augroup('TabGroup', { clear = true }),
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd 'tabclose'
    vim.api.nvim_set_current_buf(buf)
  end,
})

vim.api.nvim_create_autocmd('UIEnter', {
  group = vim.api.nvim_create_augroup('SetGUISettings', { clear = true }),
  callback = function()
    -- Options specifically targeted at Neovide
    if vim.g.neovide then
      local fontname = is_windows and 'CaskaydiaCove Nerd Font Mono' or 'Cascadia Code NF'
      vim.o.guifont = fontname .. ':h14'
      vim.g.neovide_hide_mouse_when_typing = true
      vim.g.neovide_cursor_animation_length = 0
      vim.g.neovide_cursor_trail_length = 0
    end
  end,
})

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- vim: ts=2 sts=2 sw=2 et

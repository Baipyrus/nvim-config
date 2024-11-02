-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Diagnostic keymaps
vim.keymap.del("n", "<C-W><C-D>")
vim.keymap.del("n", "<C-W>d")
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.del("n", "<leader>qq")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Open diagnostic [Q]uickfix list" })

-- Open terminal in current window
vim.keymap.del("n", "<C-/>")
vim.keymap.set({ "n", "v" }, "<leader>to", "<cmd>term<cr>", { desc = "[T]erminal [O]pen" })

-- Disable arrow keys in normal mode
vim.keymap.set({ "n", "v" }, "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set({ "n", "v" }, "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set({ "n", "v" }, "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set({ "n", "v" }, "<down>", '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.del("n", "<leader>cd")
-- Populate CMD to prepare for change directory
vim.keymap.set("n", "<leader>cd ", ":cd ", { desc = "Prepare CMD for [C]hange [D]irectory" })
-- Navigate to 'base' directory, the initial dir that nvim was run in
vim.keymap.set(
  "n",
  "<leader>cdb",
  "<cmd>cd " .. vim.g.base_dir .. "<cr>",
  { desc = "[C]hange [D]irectory to [B]ase directory" }
)
-- Navigate to 'user home' directory
vim.keymap.set("n", "<leader>cdh", "<cmd>cd " .. vim.env.HOME .. "<cr>", { desc = "[C]hange [D]irectory to [H]ome" })
-- Automatically navigate to config directory
vim.keymap.set(
  "n",
  "<leader>cdn",
  "<cmd>cd " .. vim.fn.stdpath("config") .. "<cr>",
  { desc = "[C]hange [D]irectory to [N]eovim" }
)

-- Resizing windows
vim.keymap.set({ "n", "v" }, "<M-,>", "<C-W><")
vim.keymap.set({ "n", "v" }, "<M-.>", "<C-W>>")
vim.keymap.set({ "n", "v" }, "<M-=>", "<C-W>+")
vim.keymap.set({ "n", "v" }, "<M-->", "<C-W>-")

if vim.g.neovide then
  -- System clipboard keybinds in normal and visual mode
  vim.keymap.set({ "n", "v" }, "<C-S-c>", '"+y', { desc = "Yank to System clipboard" })
  vim.keymap.set({ "n", "v" }, "<C-S-v>", '"+p', { desc = "Paste from System clipboard" })
  -- Clipboard for command and insert mode
  vim.keymap.set({ "c", "i" }, "<C-S-v>", "<C-R>+", { desc = "Paste from System clipboard" })
  -- Clipboard for terminal mode
  vim.keymap.set({ "t" }, "<C-S-v>", '<C-\\><C-n>"+pi', { desc = "Paste from System clipboard" })
end

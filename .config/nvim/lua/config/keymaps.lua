-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
vim.keymap.set("n", "<C-Down>", ":m +1<CR>==", { desc = "Move Line Down" })
vim.keymap.set("n", "<C-Up>", ":m -2<CR>==", { desc = "Move Line Up" })
vim.keymap.set("i", "<C-Down>", "<C-o>:m +1<CR><C-o>==", { desc = "Move Line Down" })
vim.keymap.set("i", "<C-Up>", "<C-o>:m -2<CR><C-o>==", { desc = "Move Line Up" })
vim.keymap.set("n", "R", ":s/", { desc = "Replace in line" })
vim.keymap.set("v", "R", 'y:%s/<c-r>"/', { desc = "Replace selection" })
vim.keymap.set("n", "<c-r>", ":%s/", { desc = "Replace" })
vim.keymap.set("v", "<c-r>", ":s/", { desc = "Replace in selection" })
vim.keymap.set("n", "U", ":redo<CR>", { desc = "Redo" })
if vim.api.nvim_get_option_value("diff", {}) then
  vim.keymap.set("n", "u", ":bufdo u<CR>", { desc = "Undo" })
  vim.keymap.set("n", "U", ":bufdo :redo<CR>", { desc = "Redo" })
end

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then
      opts.desc = "keymaps.lua: " .. opts.desc
    end
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end
map("i", "<F16>", "<C-o>", { desc = "Execute normal command and go back to insert mode" })
map("n", "<C-q>", "<cmd>q<CR>", { desc = "Close window" })
map("n", "<C-w>", "<cmd>bd<CR>", { desc = "Close buffer" })
map("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })
map("n", "<C-Down>", ":m +1<CR>==", { desc = "Move Line Down" })
map("n", "<C-Up>", ":m -2<CR>==", { desc = "Move Line Up" })
map("i", "<C-Down>", "<C-o><C-Down>", { desc = "Move Line Down" })
map("i", "<C-Up>", "<C-o><C-Up>", { desc = "Move Line Up" })

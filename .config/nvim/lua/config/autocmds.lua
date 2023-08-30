-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({
  "VimEnter",
}, {
  desc = "Auto select virtualenv Nvim open",
  pattern = "*.pyx,*.py",
  callback = function()
    require("venv-selector").retrieve_from_cache()
    vim.fn.setenv("PYTHONPATH", vim.fn.getenv("PWD"))
  end,
})

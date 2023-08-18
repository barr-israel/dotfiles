return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Open Buffers" },
      { "<leader>sB", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find In Buffer" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            ["<C-c>"] = "delete_buffer",
            ["<esc>"] = "close",
          },
        },
      },
    },
  },
  {
    "mbbill/undotree",
    keys = {
      { "<C-u>", "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>", desc = "Toggle Undo Tree" },
    },
  },
}

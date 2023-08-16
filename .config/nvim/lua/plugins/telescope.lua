return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    -- change a keymap
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Open Buffers" },
    { "<leader>fB", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find In Buffer" },
    -- add a keymap to browse plugin files
  },
}

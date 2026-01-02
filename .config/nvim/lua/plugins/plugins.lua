local HOME = os.getenv("HOME")
return {
  {
    "lervag/vimtex",
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  {
    "mbbill/undotree",
    config = function()
      vim.g["undotree_SetFocusWhenToggle"] = 1
      vim.g["undotree_WindowLayout"] = 2
    end,
    keys = {
      { "<C-u>", "<cmd>UndotreeToggle<CR>", "Undo Tree Toggle" },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {},
    },
    keys = {
      { "B", mode = { "n", "v" }, require("bufferline").pick },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            auto_close = true,
            jump = { close = true },
            layout = { preset = "default", preview = true },
          },
          files = {
            layout = { preset = "default" },
          },
        },
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          Snacks.explorer({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Explorer Snacks (current buffer dir)",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", HOME .. ".config/nvim/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}

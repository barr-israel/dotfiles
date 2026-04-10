vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/folke/tokyonight.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/mrcjkb/rustaceanvim",
	"https://github.com/folke/which-key.nvim",
	"https://github.com/folke/snacks.nvim",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/j-hui/fidget.nvim",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/rafamadriz/friendly-snippets",
})
vim.cmd("packadd nvim.undotree")
vim.cmd.colorscheme("tokyonight-night")
vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment", default = false })
require("vim._core.ui2").enable({})
require("mason").setup()
require("mason-lspconfig").setup()
require("blink.cmp").setup({
	fuzzy = { implementation = "lua" },
	signature = { enabled = true },
	completion = { documentation = { auto_show = true }, ghost_text = { enabled = true } },
	keymap = { preset = "enter" },
})
require("fidget").setup()
require("snacks").setup({
	picker = {
		enabled = true,
		auto_close = true,
		sources = {
			explorer = {
				layout = { preset = "default", preview = true },
				auto_close = true,
			},
			files = {
				layout = { preset = "default" },
			},
		},
	},
	explorer = { enabled = true, replace_netrw = true },
})

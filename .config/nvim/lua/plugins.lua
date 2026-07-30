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
	"https://github.com/chomosuke/typst-preview.nvim",
})
vim.cmd("packadd nvim.undotree")
vim.cmd.colorscheme("tokyonight-night")
vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { link = "Comment", default = false })
require("vim._core.ui2").enable({})
require("mason").setup()
require("mason-lspconfig").setup()
require("typst-preview").setup()

vim.lsp.config("vtsls", {
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, { "tsconfig.json", "jsconfig.json", "package.json", ".git" })
		local file = vim.api.nvim_buf_get_name(bufnr)
		on_dir(root or vim.fs.dirname(file))
	end,
})

require("blink.cmp").setup({
	fuzzy = { implementation = "lua" },
	signature = { enabled = true },
	completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
		list = { selection = { auto_insert = false } },
	},
	keymap = { preset = "enter" },
})
require("fidget").setup()
local mini_ai_path = vim.fn.expand("~/.local/share/nvim/lazy/mini.ai")
if vim.uv.fs_stat(mini_ai_path) then
	vim.opt.rtp:prepend(mini_ai_path)
else
	vim.pack.add({ "https://github.com/nvim-mini/mini.ai" })
end
require("mini.ai").setup()

require("snacks").setup({
	picker = {
		enabled = true,
		auto_close = true,
		actions = {
			qflist_no_open = function(picker)
				local items = picker:selected()
				if #items == 0 then
					items = picker:items()
				end
				local qf = {}
				for _, item in ipairs(items) do
					qf[#qf + 1] = {
						filename = Snacks.picker.util.path(item),
						bufnr = item.buf,
						lnum = item.pos and item.pos[1] or 1,
						col = item.pos and item.pos[2] + 1 or 1,
						end_lnum = item.end_pos and item.end_pos[1] or nil,
						end_col = item.end_pos and item.end_pos[2] + 1 or nil,
						text = item.line or item.comment or item.label or item.name or item.detail or item.text,
						pattern = item.search,
						type = ({ "E", "W", "I", "N" })[item.severity],
						valid = true,
					}
				end
				vim.fn.setqflist(qf)
				picker:close()
			end,
		},
		win = {
			input = {
				keys = {
					["<c-q>"] = { "qflist_no_open", mode = { "i", "n" } },
				},
			},
			list = {
				keys = {
					["<c-q>"] = "qflist_no_open",
				},
			},
		},
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
